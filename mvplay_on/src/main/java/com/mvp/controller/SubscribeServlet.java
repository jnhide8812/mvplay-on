package com.mvp.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvp.model.SubscribtionVO;
import com.mvp.service.PurchaseService;

@WebServlet("/purchase/")
public class SubscribeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Autowired
    private PurchaseService purchaseService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        //세션 값 물고다니게 하기
        if ("step1".equals(action)) {
            handleStep1(request, response, session);
        } else if ("step2".equals(action)) {
            handleStep2(request, response, session);
        } else if ("step3".equals(action)) {
            handleStep3(request, response, session);
        } else {
            response.sendRedirect(request.getContextPath() + "/purchase/payfail.jsp");
        }
    }

    private void handleStep1(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String goods = request.getParameter("goods");
        if (goods != null) {
            session.setAttribute("goods", goods);

            int priceMonthly = 0;
            int priceYearly = 0;
            int priceMonthlyDiscounted = 0;
            if ("b".equals(goods)) {
                priceMonthly = 7900;
                priceYearly = 79900;
                priceMonthlyDiscounted = 6660;
            } else if ("p".equals(goods)) {
                priceMonthly = 8900;
                priceYearly = 89900;
                priceMonthlyDiscounted = 7490;
            }
            session.setAttribute("priceMonthly", priceMonthly);
            session.setAttribute("priceYearly", priceYearly);
            session.setAttribute("priceMonthlyDiscounted", priceMonthlyDiscounted);

            response.sendRedirect(request.getContextPath() + "/purchase/subscribe2.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/purchase/payfail.jsp");
        }
    }

    private void handleStep2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String period = request.getParameter("period");
        if (period != null) {
            session.setAttribute("period", period);
            response.sendRedirect(request.getContextPath() + "/purchase/subscribe3.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/purchase/payfail.jsp");
        }
    }

    private void handleStep3(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        String period = (String) session.getAttribute("period");
        String goods = (String) session.getAttribute("goods");
        if (period != null && goods != null) {
            int price = 0;
            if ("1개월".equals(period)) {
                price = (Integer) session.getAttribute("priceMonthly");
            } else if ("12개월".equals(period)) {
                price = (Integer) session.getAttribute("priceYearly");
            }

            SubscribtionVO newSubscription = new SubscribtionVO();
            newSubscription.setSubscribePrice(price);
            newSubscription.setStartDate(new Date());

            Calendar calendar = Calendar.getInstance();
            if ("1개월".equals(period)) {
                calendar.add(Calendar.MONTH, 1);
            } else if ("12개월".equals(period)) {
                calendar.add(Calendar.YEAR, 1);
            }
            newSubscription.setExpiredDate(calendar.getTime());

            String userId = (String) session.getAttribute("userId");
            newSubscription.setUserId(userId);
            purchaseService.enrollSubscription(newSubscription);

            response.sendRedirect(request.getContextPath() + "/purchase/success.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/purchase/payfail.jsp");
        }
    }
}
