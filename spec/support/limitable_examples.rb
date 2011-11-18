shared_examples_for "any limitable" do
  let(:field_names) { ["field1", "field2"] }
  it "should accept nested limit_fields" do
    (subject.fields.map(&:name) - field_names).should == []
  end
end
