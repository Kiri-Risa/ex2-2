class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each (record, attribute, value)
    unless value =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      record.errors[attribute] << (options[:message] || "はメールアドレスではありません")
    else 
      if value.length > 255
        record.errors[attribute] << (options[:message] || "は255文字以内で入力してください")
      end
    end
  end
end
