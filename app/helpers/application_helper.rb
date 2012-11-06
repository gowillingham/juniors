module ApplicationHelper
	def dollarify(i)
		number_to_currency(i * 0.01)
	end
end

def league_when_and_where_grid(emailify)
  arr = []
  
  if emailify
	  header_table_style = " width='600' style='border-collapse:collapse;margin:20px 0;font-size:11px;'"
	  header_row_style = " style='background-color:#000;color:#fff;text-align:left;'"
	  header_cell_style = " style='border:solid 1px #000;'"
	else
		cls = " class='table'"
	end

  arr << "<table#{header_table_style}#{cls}>"
  arr << "<thead>"
  arr << "<tr#{header_row_style}>"
  arr << "<th#{header_cell_style}>Date</th>"
  arr << "<th#{header_cell_style}>Beginner</th>"
  arr << "<th#{header_cell_style}>Intermediate</th>"
  arr << "<th#{header_cell_style}>Site</th>"
  arr << "<th#{header_cell_style}></th>"
  arr << "</tr>"
  arr << "</thead>"
  
  arr << "<tbody>"
  INHOUSE_LEAGUE_SESSION_GRID.each do |row|
    arr << "<tr>"
    arr << "<td#{header_cell_style}>#{row[0]}</td>"
    arr << "<td#{header_cell_style}>#{row[1]}</td>"
    arr << "<td#{header_cell_style}>#{row[2]}</td>"
    arr << "<td#{header_cell_style}>#{row[3]}</td>"
    arr << "<td#{header_cell_style}>#{row[4]}</td>"
    arr << "</tr>"
  end
  arr << "</tbody>"
  arr << "</table>"
  
  arr.join
end
