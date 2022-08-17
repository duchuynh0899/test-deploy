/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author nguye
 */
public class DepartmentDAOTest {
    DepartmentDAO d;
    
    public DepartmentDAOTest() {
         d = new DepartmentDAO();
        
    }

    @Test
    public void testListDep() {
    }

    @Test
    public void testGetDepartmentDetailbyID() {
    }

    @Test
    public void testPagingDepartment() {
    }

    @Test
    public void testGetTotalDepartment() {
        int total = d.getTotalDepartment();
        int expected = 7;
        assertEquals(expected, total);
    }
    
 

    @Test
    public void testPagingDepartmentByText() {
    }

    @Test
    public void testGetAllDepartmentByText() {
    }

    @Test
    public void testGetTotalDepartmentByText() {
    }

    @Test
    public void testMain() {
    }
    
}
