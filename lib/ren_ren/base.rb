# -*- coding: utf-8 -*-
require 'uri'
require 'multi_json'
require 'net/http'
require 'digest'

module RenRen
  class Base
    extend Forwardable
    
    def_delegators :client, :get, :post, :put, :delete
    
    attr_accessor :params
    
    def initialize(access_token)
      @params = {}
      @params[:method] = "friends.get"
      @params[:call_id] = Time.now.to_i
      @params[:format] = 'json'
      @params[:v] = '1.0'
      @params[:access_token] = access_token
    end
    
    def call_method(opts = {:method => "users.getinfo"})
      MultiJson.decode(Net::HTTP.post_form(URI.parse('http://api.renren.com/restserver.do'), update_params(opts)).body)
    end
    
    private
      def update_params(opts)
        params = @params.merge(opts){|key, first, second| second}
        params[:sig] = Digest::MD5.hexdigest(params.map{|k,v| "#{k}=#{v}"}.sort.join + Config.api_secret)
        params
      end
      
      def perform_get(path, options={})

      end

      def perform_post(path, options={})

      end

      def perform_put(path, options={})

      end

      def perform_delete(path, options={})

      end      
  end
end