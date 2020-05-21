class GhostController < ApplicationController
	protect_from_forgery with: :null_session
	def eat
		render plain: "吃土"
	end
	def request_headers
		render plain: request.headers.to_h
									.reject{|key, value| key.include? '.'}
									.map{|key, value| "#{key}: #{value}"}
									.sort.join("\n")
	end
	def request_body
		render plain: request.body
	end
	def response_headers
		response.headers['5566'] = 'QQ'
		render plain: response.headers.to_h
									.map{|key, value| "#{key}: #{value}"}
									.sort.join("\n")
	end
	def show_response_body
		puts "===這是設定前的response.body:#{response.body}==="
		render plain: "哇哈哈"
		puts "===這是設定後的response.body:#{response.body}==="
	end
	def webhook
		#head :ok 
		render plain: params
	end
	def sent_request
		uri = URI('http://localhost:3000/ghost/eat')
		http = Net::HTTP.new(uri.host, uri.port)
		http_request = Net::HTTP::Get.new(uri)
		http_response = http.request(http_request)

		render plain: JSON.pretty_generate({
			request_class: request.class,
			response_class: response.class,
			http_request_class: http_request.class,
			http_response_class: http_response.class
		})


	end
	def sent_request2
		uri = URI('http://localhost:3000/ghost/response_body')
		response = Net::HTTP.get(uri).force_encoding("UTF-8")
		render plain: translateToKo(response)
	end
	def translateToKo(msg)
		"#{msg}油~"
	end

end
