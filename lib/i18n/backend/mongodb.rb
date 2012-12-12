require "i18n"

module I18n
  module Backend
    class MongoDB
      include Base, Flatten
      
      attr_accessor :collection
      
      def initialize(collection, auto_insert_missing=false)
        @collection, @auto_insert_missing = collection, auto_insert_missing
        @collection.ensure_index([['k', 1], ['l', 1]], unique: true)
      end
      
      def available_locales
        collection.distinct(:l).map(&:to_sym)
      end
      
      def keys
        collection.distinct(:k)
      end
      
      def store_translations(locale, data, options={})
        flatten_translations(locale, data, options.fetch(:escape, false), false).each do |key, value|
          update_collection(locale, key, value)
        end
      end
      
      def translate(locale, key, options={})
        super
      rescue I18n::MissingTranslationData => e
        update_collection(locale, key, nil) if @auto_insert_missing
        raise e
      end
      
      protected
      
      def lookup(locale, key, scope=[], options={})
        key   = normalize_flat_keys(locale, key, scope, options[:separator])
        value = collection.find_one({ k: key.to_s, l: locale.to_s }, { fields: { v: 1 }, transformer: lambda{|d|d['v']} })
        value.is_a?(Hash) ? value.deep_symbolize_keys : value
      end
      
      def update_collection(locale, key, value)
        collection.update({ k: key.to_s, l: locale.to_s }, { '$set' => { v: value } }, { upsert: true })
      end
    end
  end
end
