describe "VCR and Webmock working together" do

  let(:url) { URI.parse 'https://s3.amazonaws.com' }

  it "fails for net request" do
    expect { Net::HTTP.get(url) }.to raise_error
  end

end
