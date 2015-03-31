RSpec.describe Docomoru::CommandBuilder do
  let(:argv) do
    []
  end

  let(:command_builder) do
    described_class.new(argv)
  end

  describe "#build" do
    subject do
      command_builder.call.call
    end

    let(:dummy_response) do
      double(
        body: {},
        headers: {},
        status: 200,
        status_message: "OK",
      )
    end

    context "with unknown command line option" do
      let(:argv) do
        super() << "--unknown"
      end

      it "aborts with help message" do
        expect_any_instance_of(Docomoru::Commands::Error).to receive(:abort)
        subject
      end
    end
  end
end
