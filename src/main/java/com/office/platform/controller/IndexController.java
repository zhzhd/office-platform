package com.office.platform.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(value = "生产者进程API接口")
@RestController
@RequestMapping("/index")
public class IndexController {
    @ApiOperation(value="发送解析文本", notes="发送解析文本", produces="application/json")
    @RequestMapping(value = "/home")
    public String homePage(){
        return "homepage";
    }
}
