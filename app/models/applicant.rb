class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position
  validates :name, :email, :phone, :resume, presence: true
  has_one_attached :resume

  validate :correct_resume_mime_type

  private

  def correct_resume_mime_type
    if resume.attached? && !resume.content_type.in?('application/pdf')
      errors.add(:resume, 'Currículo foi enviado com o tipo de documento inválido. Favor enviar somete PDF.')
    end
  end
end
