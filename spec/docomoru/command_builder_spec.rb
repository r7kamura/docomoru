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

    context "with create_dialogue" do
      let(:argv) do
        super() + %w[create_dialogue message --api-key dummy]
      end

      it "calls create_dialogue method" do
        expect_any_instance_of(Docomoru::Commands::Request).to receive(:print)
        expect_any_instance_of(Docomoru::Client).to receive(:create_dialogue).and_return(dummy_response)
        subject
      end
    end

    context "with create_knowledge" do
      let(:argv) do
        super() + %w[create_knowledge message --api-key dummy]
      end

      it "calls create_knowledge method" do
        expect_any_instance_of(Docomoru::Commands::Request).to receive(:print)
        expect_any_instance_of(Docomoru::Client).to receive(:create_knowledge).and_return(dummy_response)
        subject
      end
    end
  end
end
