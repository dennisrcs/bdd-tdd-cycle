Given /^the following movies exist:$/ do |table|
  # table is a Cucumber::Core::Ast::DataTable
  # pending # Write code here that turns the phrase above into concrete actions
  table.hashes.each do |row|
    movie = Movie.new(:title => row["title"], :rating => row["rating"], :director => row["director"], :release_date => row["release_date"])
    movie.save
  end
end

Then /^the director of "(.*)" should be "(.*)"/ do |title, director|
  movie = Movie.where(:title => title).first
  assert(movie.director == director, "directos don't match")
end

