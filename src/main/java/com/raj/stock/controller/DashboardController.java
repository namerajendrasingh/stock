package com.raj.stock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raj.stock.dto.StockDTO;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    @GetMapping
    public String getStocks(Model model) {
        return "dashboard";
    }

    @PostMapping
    public String addStock(@ModelAttribute StockDTO stockDTO) {
      
        return "redirect:/dashboard";
    }

}
