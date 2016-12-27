
RSpec.describe Post, type: :model do

  let!(:post) { Post.new(title: 'test driven development', body: 'lorem lorem') }

  describe 'Validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_inclusion_of(:state).in_array(['draft', 'published']) }
  end

  describe '#Method' do
    context '#formarted_title' do
      it 'has title titleized when input all lower case' do
        expect(post.formarted_title).to eq('Test Driven Development')
      end

      it 'has title titleized when input uknown case letter' do
        post.title = 'tEst driVen developMent'
        expect(post.formarted_title).to eq('Test Driven Development')
      end

      it 'calls post.created_at.sunday?' do
        expect(post.created_at).to receive('sunday?')
        post.posted_on_sunday?
      end

      it 'stubed sunday?' do
        post.created_at.stub(:sunday?)
        expect(post.posted_on_sunday?).to eq(nil)
      end
    end

    context '#published?' do
      it 'is published when has state published' do
        post.state = 'published'
        expect(post.published?).to be_truthy
      end

      it 'is not published when does not have state published' do
        post.state = 'draft'
        expect(post.published?).to be_falsey
      end
    end

    context '#draft?' do
      it 'is draft when has state draft' do
        post.state = 'draft'
        expect(post.draft?).to be_truthy
      end

      it 'is not draft when has state published' do
        post.state = 'published'
        expect(post.draft?).to be_falsey
      end
    end
  end

  describe '.Method' do
    context '.publishes' do
      it 'shows only published post' do
        Post.create(title: 'test driven development 0', body: 'lorem lorem', state: 'published')
        Post.create(title: 'test driven development 1', body: 'lorem lorem', state: 'draft')

        expect(Post.publishes.any?).to be_truthy
      end
    end
  end

end
