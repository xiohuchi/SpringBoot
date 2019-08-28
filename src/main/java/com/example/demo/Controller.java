package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

@RestController
public class Controller {
    @GetMapping("/")
    public String hello() {
        var numbers = new int[]{1, 2, 3, 4, 5, 6, 7};
        int[] subset = Arrays.stream(numbers).filter((var a) -> a > 5).toArray();
        for (int value : subset) {
            System.out.println(value);
        }
        return "Hello! This is SpringBoot Initialize! ";
    }
}
