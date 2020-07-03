package main.java.com.hrm.service.Impl;

import main.java.com.hrm.mapper.PostDao;
import main.java.com.hrm.pojo.Post;
import main.java.com.hrm.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.XMLFormatter;

@Service("postService")
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;

    @Override
    public List<Post> selectAllPost() {
        return postDao.selectAllPost();
    }

    @Override
    public int insertPost(String postName) {
        return postDao.insertPost(postName);
    }

    @Override
    public int deletePostById(int postId) {
        return postDao.deletePostById(postId);
    }

    @Override
    public Post selectPostById(int postId) {
        return postDao.selectPostById(postId);
    }

    @Override
    public int updatePost(Post post) {
        return postDao.updatePost(post);
    }

    @Override
    public List<Post> selectPostByPage(int firstResult, int maxResult) {
        return postDao.selectPostByPage(firstResult,maxResult);
    }

    @Override
    public int selectPostCount() {
        return postDao.selectPostCount();
    }
}
