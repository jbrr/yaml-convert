require 'yaml'

class YamlConvert
  attr_reader :path, :yml, :output, :output_path

  def initialize(path, output_path)
    @path = path
    @output_path = output_path
    @yml = YAML.load_file(path)
    @output = {}
  end

  def create_hash
    yml.each do |key, value|
      embedded_keys = key.split('/')
      key_values = embedded_keys.reverse.inject(value) { |a, n| { n => a } }
      output.deep_merge(key_values)
    end
  ensure_quotes(output)
  write_file
  end

  def ensure_quotes(h)
    h.each do |k, v|
      if v.is_a?(Hash)
        ensure_quotes(v)
        next
      end
      if h[k].is_a?(String)
        h[k] = v + "__ensure_quotes__\n "
      elsif h[k].is_a?(Array)
        h[k] = h[k].map do |element|
          element += "__ensure_quotes__\n "
        end
      end
    end
  end

  def write_file
    File.open(output_path, 'w') { |f| YAML.dump(output, f, line_width: -1)}
    `sed -i '' "s/__ensure_quotes__[\\]n //g" #{output_path}`
  end
end

class ::Hash
    def deep_merge(second)
        merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge!(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
        self.merge!(second.to_h, &merger)
    end
end
