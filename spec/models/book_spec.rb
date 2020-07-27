describe Book, elasticsearch: true do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:publisher) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:published_at) }
end
