describe Vote do
	describe "validations" do
		describe "value validation" do
			it "only allows -1 or 1 as values" do
				expect ( @post.votes ).to eq(1)
				expect ( @post.votes ).to eq(-1)
			end
		end
	end
end


