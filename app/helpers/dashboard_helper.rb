module DashboardHelper
  def date_formatter(date)
    if date.month == 1
      month = "January"
    elsif date.month == 2
      month = "February"
    elsif date.month == 3
      month = "March"
    elsif date.month == 4
      month = "April"
    elsif date.month == 5
      month = "May"
    elsif date.month == 6
      month = "June"
    elsif date.month == 7
      month = "July"
    elsif date.month == 8
      month = "August"
    elsif date.month == 9
      month = "September"
    elsif date.month == 10
      month = "October"
    elsif date.month == 11
      month = "November"
    elsif date.month == 12
      month = "December"
    end
  end
end
