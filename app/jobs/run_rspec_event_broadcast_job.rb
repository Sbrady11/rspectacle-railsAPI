class RunRspecEventBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform
    ActionCable.server.broadcast(
      'playground_channel',
      testResult: test_result
    )
  end
  private
    def test_result
      run_test.to_json
    end
    def run_test
      rspec_result = JSON.parse(%x(rspec ./public/playground/spec/code_spec.rb --format j))
      test_result_hash = {
        examples: rspec_result["examples"].map {|ex| ex.select{ |key| ["full_description", "status", "line_number", "run_time"].include?(key)}},
        summary: rspec_result["summary"],
        summary_line: rspec_result["summary_line"]
      }
    end
end
