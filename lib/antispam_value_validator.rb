class AntispamValueValidator < ActiveModel::Validator  

  def validate(object)  
    condition ||= (object.antispam.to_i == 270 && object.antispam_question.to_i == 1)
    condition ||= (object.antispam.to_i == 50 && object.antispam_question.to_i == 2)
    condition ||= (object.antispam.to_i == 140 && object.antispam_question.to_i == 3)
    condition ||= (object.antispam.to_i == 380 && object.antispam_question.to_i == 4)
    condition ||= (object.antispam.to_i == 1000 && object.antispam_question.to_i == 5)
    object.errors[:base] = "Es spammer" unless condition
  end  
end