class AntispamValueValidator < ActiveModel::Validator  

  def validate(object)  
    condition ||= (object.antispam.to_i == 27 && object.antispam_question.to_i == 1)
    condition ||= (object.antispam.to_i == 5 && object.antispam_question.to_i == 2)
    condition ||= (object.antispam.to_i == 14 && object.antispam_question.to_i == 3)
    condition ||= (object.antispam.to_i == 38 && object.antispam_question.to_i == 4)    
    condition ||= (object.antispam.to_i == 100 && object.antispam_question.to_i == 5)
    object.errors[:base] = "This record is invalid" unless condition
  end  
end