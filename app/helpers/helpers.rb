require_relative '../models/api_model.rb'

helpers do

  # This query type will be a stretch feature; not MVP
  # def alchemy_query(query_text, query_target)
  #   alchemyapi = AlchemyAPI.new()

  #   puts "Making calls "

  #   response = alchemyapi.sentiment_targeted('text', query_text, query_target)

  #   if response['status'] == 'OK'
  #     puts 'All clear. Response object inbound'
  #     puts JSON.pretty_generate(response)

  #     puts "Targeted sentiment analysis forthcoming"
  #     puts "type: " + response['docSentiment']['type']

  #     if response['docSentiment'].key?('score')
  #       puts 'score: ' + response['docSentiment']['score']
  #     end

  #   else
  #     puts "That was an invalid request: " + response['statusInfo']
  #     puts response
  #   end
  # end

  def sentiment_query(query_text)
    alchemyapi = AlchemyAPI.new()
    response = alchemyapi.sentiment('text', query_text)
    if response['status'] == 'OK'
      puts "Generating response"
      puts JSON.pretty_generate(response)
      if response['docSentiment'].key?('score')
        puts 'score: ' + response['docSentiment']['score']
      end
    else
      puts 'Error in sentiment call: ' + response['statusInfo']
    end
  end

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

end
