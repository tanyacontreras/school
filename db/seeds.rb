# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# School.create(name: 'Westminster Avenue Elementary School', address: '1010 Abbott Kinney Boulevard', city: 'Venice', zip: '90291', phone_number: '310-392-3041', url: 'http://www.lausd.net/Westminster_Ave_EL/Westminster_Community/Home.html', county: 'Los Angeles', school_type: 'public - magnet', grade_level: 'Elementary School', rating: '8', latitude: '33.99232', longitude: '33.99232')

# To get started we created a model like this:
# rails g model Scott location_id location_name address_number street_name intersection city state contact_name phone1 phone2 phone3 phone4 mc_phone1 mc_phone2 mc_phone3 mc_phone4 standing_file last_modified_date file_under_area file_under_county dsf_main_category dsf_sub_category location_service location_service_id_code

School.destroy_all
# This will eventually hold column names that exist in the first row
cols = []

# Establish a final holding bin for everything
data = []
is_first_line = true

# Open the file in read-only format
File.open("public_schls.txt", "r") do |infile|
	puts "hello" + infile.inspect
	# Cycle through every line
    while (line = infile.gets)
    	# Track if we're in or out of quotes
    	in_quotes = false
    	# Incrementally add a character at a time into this string
    	txt = ""
    	# Holding bin for each cell in this row
    	this_row = []
    	# Iterate through each character in this row
    	(0..line.length - 1).each do |idx|
    		# Quotes are kinda special
    		if line[idx] == "\""
    			in_quotes = !in_quotes
    		else
    			# Anything but quotes
    			# If we're out of quotes and we see a comma  it goes to the next cell
    			if !in_quotes && line[idx] == "\t"
    				# New field here!
    				this_row.push(txt)
    				# Start of a new cell of content
    				txt = ""
    			else
    				# Add a character at a time to the cell content
    				txt += line[idx]
    			end
    		end
    	end
    	# Probable that we at least had one cell
    	this_row.push(txt.strip)

    	if is_first_line
    		cols = this_row
    		is_first_line = false
    	else
	    	do_this = {}
	    	(0..cols.length - 1).each do |col_idx|
		    	if cols[col_idx].downcase != 'x'
		    			do_this.store(cols[col_idx], this_row[col_idx])
		    	end
    	end
    end
    	# OK, let's put another document in the mix
#    	puts do_this.inspect
	begin
    School.create(do_this)
  rescue 
  	puts do_this.inspect
  end
  end
end
#puts data.inspect