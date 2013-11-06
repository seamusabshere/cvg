Before do
  @input_csv_paths = []
  @args = []
end

Given(/^an input csv$/) do |string|
  path = File.join(Dir.tmpdir, "#{rand.to_s}.csv")
  File.write(path, string)
  @input_csv_paths << path
end

When(/^you pass arguments (.+)$/) do |args|
  @args << args.strip
end

Then(/^you get output$/) do |expected_output_csv|
  bin_path = File.expand_path '../../../bin/csvgrep2', __FILE__
  cmd = "#{bin_path} #{@args.join(' ')} #{@input_csv_paths.join(' ')}"
  child = POSIX::Spawn::Child.new cmd
  if child.err.present?
    $stderr.puts
    $stderr.puts cmd
    $stderr.puts child.err
    $stderr.puts
  end
  expect(child.out.strip).to eq(expected_output_csv.strip)
end
