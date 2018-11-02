Time::DATE_FORMATS.merge!(
   datetime_military: '%Y-%m-%d %H:%M',
   datetime:          '%Y-%m-%d %I:%M%P',
   time:              '%I:%M%P',
   datetime_short:    '%m/%d %I:%M',
   due_date: lambda { |time| time.strftime("%a, %b #{time.day.ordinalize}") }
)