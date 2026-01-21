package com.admin;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class AttendanceManager {

    public void saveAttendance(Attendance attendance) {
        Session session = null;
        Transaction tx = null;

        try {
            session = AdminFactory.getSession();
            tx = session.beginTransaction();
            session.persist(attendance);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }
}
