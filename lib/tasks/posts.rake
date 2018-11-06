namespace :posts do
  desc "remove patients discharged 5 years ago"
  task delete_old_discharges: :environment do
    Patient.all.each do |patient|
      if (patient.discharge.try(:date))
        if (patient.discharge.date < 5.years.ago)
          patient.destroy
        end
      end
    end
  end
end