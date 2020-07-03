package main.java.com.hrm.mapper;

import main.java.com.hrm.pojo.Post;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PostDao {

    //查找所有的职位
    public List<Post> selectAllPost();

    //新增职位
    public int insertPost(String postName);

    //根据Id删除职位
    public int deletePostById(int postId);

    //根据Id查找职位
    public Post selectPostById(int postId);

    //更新职位信息
    public int updatePost(Post post);

    //根据页数查找职位
    public List<Post> selectPostByPage(int firstResult,int maxResult);

    //查找职位数目
    public int selectPostCount();
}
