class CatRentalRequest < ApplicationRecord

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w[PENDING APPROVED DENIED] }

  validate :does_not_overlap_approved_requests

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat.id)
      .where.not(id: self.id)
      .where(start_date: (self.start_date..self.end_date))
      .where(end_date: (self.start_date..self.end_date))
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def does_not_overlap_approved_requests
    overlapping_approved_requests.exists?
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def approve!

    self.status = "APPROVED"
    self.save
    overlapping_pending_requests.each { |request| request.deny! }
  end

  def deny!
    self.status = "DENIED"
    self.save
  end


end
