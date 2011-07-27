# == Schema Information
# Schema version: 20110721065357
#
# Table name: clinicalhistories
#
#  id                        :integer         not null, primary key
#  assessmentdate            :string(255)
#  medicalhistory            :string(255)
#  reasonconsultation        :string(255)
#  evaluation                :string(255)
#  treatment                 :string(255)
#  medicaldiagnosic          :string(255)
#  physiotherapistdiagnostic :string(255)
#  startdatetto              :string(255)
#  enddatetto                :string(255)
#  nsessions                 :integer
#  frequency                 :integer
#  comments                  :string(255)
#  created_at                :datetime
#  updated_at                :datetime
#  paciente_id               :integer
#  code                      :integer
#  expedient                 :string(255)
#  authorization             :string(255)
#  authorizationcomments     :string(255)
#  rate_id                   :integer
#  provenance_id             :integer
#

class Clinicalhistory < ActiveRecord::Base
      attr_accessible :assessmentdate,:medicalhistory, :reasonconsultation, :evaluation, :treatment,
                      :medicaldiagnosic, :physiotherapistdiagnostic, :startdatetto ,:enddatetto,
                      :nsessions, :frequency,:comments, :paciente_id, :code, :expedient, :authorization, :rate_id, :provenance_id
      attr_accessor :duplicado             
      belongs_to  :paciente
      belongs_to  :rate      
      belongs_to  :provenance
      paginates_per 1
      has_many  :events
      
end
