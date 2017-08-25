

library(rtweet)

#########################################################################
######## pls see http://rtweet.info/index.html for usage of rtweet package
### need to create and store some ouths to being able to access twitter api

## name assigned to created app
appname <- "myR_app_for_analysing_Tweets"
## api key (example below is not a real key)
key <- "AkyUraAbGFK1qDNhQS3GFiYYS"
## api secret (example below is not a real key)
secret <- "LLQmVWliiGZD5Y2rqLik8kETGsBsxeiVEctraOEwfYEv7jzs3d"
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

######## pls see http://rtweet.info/index.html for usage of rtweet package
#########################################################################
#########################################################################



# stream live teets of a certain hashtag for a period of time

livetweets <- stream_tweets(q = "ibm", timeout = 30, parse = TRUE, token = twitter_token, fix.encoding = TRUE)
# plot the live streamed twitter data by secs
str(livetweets)
ts_plot(livetweets, by = "secs")


# search all tweet for a certain hashtag for a number of maxtweets and plt the dataframe

df_twitter_feed <- search_tweets("#IBMWatson OR #IBM" , n= 1000, include_rts = FALSE)
str(df_twitter_feed)
# mutate(df_eclipse_clean, created_at= as.Date(created_at, format= "%Y-%m-%d %HH:%%MM:%ss"))
# agg <- ts_filter(df_twitter_feed, by = "secs")
ts_plot(df_twitter_feed, by = "hours")

# get the current trends and filter from the trends df the WOEID of Vienna, by specifying the country_code and 
# place_type - and then extract only the field [woeid]

trends <- trends_available()
trends[trends$countryCode == "AT" & trends$place_type == "Town",][["woeid"]]


