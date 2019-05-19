
task default: [:compile]

desc "Compile site HTML using nanoc."
task :compile do
  system 'bundle exec nanoc compile'
end

desc "Compile and deploy site."
task :deploy => [ :compile ] do
  system 'bundle exec nanoc deploy'
end

task :test do
  system 'bundle execnanoc compile'
end
