package main.java.com.hrm.controller;


import main.java.com.hrm.pojo.Post;
import main.java.com.hrm.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PostController {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "/findAllPost")
    public String findAllPost(int page,HttpServletRequest request) {
        int maxResult=10;
        int firstResult=(page-1)*maxResult;
        List<Post> postList = postService.selectPostByPage(firstResult, maxResult);
        int postCount = postService.selectPostCount();
        int pageNum;
        if(postCount%10==0){
            pageNum=postCount/10;
        }else{
            pageNum=postCount/10+1;
        }
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("postList", postList);
        request.setAttribute("postCount",postCount);
        request.setAttribute("page",page);
        return "postInformation";
    }

    @ResponseBody
    @RequestMapping(value = "/deletePost")
    public String deletePost(@RequestParam("postId") int postId) {
        int i = postService.deletePostById(postId);
        if (i > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/insertPost")
    public String insertPost(@RequestParam("postName") String postName) {
        int i = postService.insertPost(postName);
        if (i > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/findPost")
    public Post findPost(@RequestParam("postId") int postId) {
        Post post = postService.selectPostById(postId);
        return post;
    }


    @ResponseBody
    @RequestMapping(value = "/updatePost")
    public String updatePost(@RequestBody Post post){
        int i = postService.updatePost(post);
        if(i>0){
            return "success";
        }else{
            return "error";
        }
    }

}
