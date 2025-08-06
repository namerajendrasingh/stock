package com.raj.stock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.raj.stock.entity.Stock;
import com.raj.stock.service.StockService;

@Controller
public class StockController {
    @Autowired
    private StockService stockService;

    @GetMapping("/stocks")
    public String showStocks(@RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "10") int size,
                            Model model) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Stock> stockPage = stockService.getStocks(pageable);
        model.addAttribute("page", stockPage);
        model.addAttribute("stock", null); // For add form
        return "stocks";
    }

    @GetMapping("/stocks/edit/{id}")
    public String editStock(@PathVariable Long id,
                           @RequestParam(defaultValue = "0") int page,
                           @RequestParam(defaultValue = "10") int size,
                           Model model) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Stock> stockPage = stockService.getStocks(pageable);
        model.addAttribute("page", stockPage);
        model.addAttribute("stock", stockService.getStockById(id));
        return "stocks";
    }

    @PostMapping("/stocks/add")
    public String addStock(@ModelAttribute Stock stock, Model model) {
        try {
            stockService.saveStock(stock);
            model.addAttribute("successMessage", "Stock added successfully!");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to add stock: " + e.getMessage());
        }
        return showStocks(0, 10, model);
    }

    @PostMapping("/stocks/update")
    public String updateStock(@ModelAttribute Stock stock, Model model) {
        try {
            stockService.saveStock(stock);
            model.addAttribute("successMessage", "Stock updated successfully!");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to update stock: " + e.getMessage());
        }
        return showStocks(0, 10, model);
    }

    @GetMapping("/stocks/delete/{id}")
    public String deleteStock(@PathVariable Long id, Model model) {
        try {
            stockService.deleteStock(id);
            model.addAttribute("successMessage", "Stock deleted successfully!");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to delete stock: " + e.getMessage());
        }
        return showStocks(0, 10, model);
    }
}
