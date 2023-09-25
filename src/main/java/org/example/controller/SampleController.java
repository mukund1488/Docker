package org.example.controller;

import org.example.domain.User;
import org.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/test")
    public User getInfo() {
        return userRepository.findById(1L).orElse(null);
    }
}
