# -*- coding: utf-8 -*-
require 'uri'
require 'multi_json'
require 'net/http'
require 'digest'

module RenRen
  class Base

    attr_accessor :params
    
    def initialize(access_token)
      @params = {}
      @params[:method] = "users.getInfo"
      @params[:call_id] = Time.now.to_i
      @params[:format] = 'json'
      @params[:v] = '1.0'
      @params[:access_token] = access_token
    end
    
    def api(opts = {:method => "users.getInfo"})
      MultiJson.decode(Net::HTTP.post_form(URI.parse('http://api.renren.com/restserver.do'), merge_params(opts)).body)
    end
    
    private
      def merge_params(opts)
        params = @params.merge(opts){|key, first, second| second}
        params[:sig] = Digest::MD5.hexdigest(params.map{|k,v| "#{k}=#{v}"}.sort.join + RenRen::Config.api_secret)
        params
      end    
  end
end