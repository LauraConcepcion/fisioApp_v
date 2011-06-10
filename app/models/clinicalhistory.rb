# == Schema Information
# Schema version: 20110608151617
#
# Table name: clinicalhistories
#
#  id                        :integer         not null, primary key
#  assessmentdate            :date
#  medicalhistory            :text
#  reasonconsultation        :text
#  evaluation                :text
#  treatment                 :text
#  medicaldiagnosic          :string(255)
#  physiotherapistdiagnostic :text
#  startdatetto              :date
#  enddatetto                :date
#  nsessions                 :integer
#  frequency                 :integer
#  comments                  :text
#  created_at                :datetime
#  updated_at                :datetime
#

class Clinicalhistory < ActiveRecord::Base
      attr_accessible :assessmentdate,:medicalhistory, :reasonconsultation, :evaluation, :treatment,
                      :medicaldiagnosic, :physiotherapistdiagnostic, :startdatetto ,:enddatetto,
                      :nsessions, :frequency,:comments, :paciente_id                
      belongs_to  :paciente
      paginates_per 1
end
