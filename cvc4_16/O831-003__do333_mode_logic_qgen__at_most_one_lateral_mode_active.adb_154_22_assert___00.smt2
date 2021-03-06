(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-const roll_active Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const hdg_active Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const nav_active Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const lappr_active Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const lga_active Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-const attr__ATTRIBUTE_ADDRESS20 Int)

(declare-const attr__ATTRIBUTE_ADDRESS21 Int)

(declare-const attr__ATTRIBUTE_ADDRESS22 Int)

(declare-const attr__ATTRIBUTE_ADDRESS23 Int)

(declare-const attr__ATTRIBUTE_ADDRESS24 Int)

(declare-const attr__ATTRIBUTE_ADDRESS25 Int)

(assert
;; defqtvc
 ;; File "at_most_one_lateral_mode_active.ads", line 15, characters 0-0
  (not
  (forall ((hdg_active_out1 Bool) (lappr_active_out1 Bool)
  (lga_active_out1 Bool) (nav_active_out1 Bool) (roll_active_out1 Bool)
  (nor_lga_out1 Bool) (not1_out1 Bool) (not5_out1 Bool) (nor_lappr_out1 Bool)
  (not1_out1_1 Bool) (not5_out1_1 Bool) (nor_nav_out1 Bool)
  (not1_out1_2 Bool) (not5_out1_2 Bool) (nor_hdg_out1 Bool)
  (not1_out1_3 Bool) (not5_out1_3 Bool) (nor_roll_out1 Bool)
  (not1_out1_4 Bool) (not5_out1_4 Bool) (and_out1 Bool))
  (=> (= hdg_active_out1 hdg_active)
  (=> (= lappr_active_out1 lappr_active)
  (=> (= lga_active_out1 lga_active)
  (=> (= nav_active_out1 nav_active)
  (=> (= roll_active_out1 roll_active)
  (=>
  (= nor_lga_out1 (ite (= (ite (= (ite (= (ite (= roll_active_out1 true) true
                                          hdg_active_out1) true)
                                  true nav_active_out1) true)
                          true lappr_active_out1) true)
                  false true))
  (=> (= not1_out1 (ite (= lga_active_out1 true) false true))
  (=> (= not5_out1 (ite (= not1_out1 true) true nor_lga_out1))
  (=>
  (= nor_lappr_out1 (ite (= (ite (= (ite (= (ite (= roll_active_out1 true)
                                            true hdg_active_out1) true)
                                    true nav_active_out1) true)
                            true lga_active_out1) true)
                    false true))
  (=> (= not1_out1_1 (ite (= lappr_active_out1 true) false true))
  (=> (= not5_out1_1 (ite (= not1_out1_1 true) true nor_lappr_out1))
  (=>
  (= nor_nav_out1 (ite (= (ite (= (ite (= (ite (= roll_active_out1 true) true
                                          hdg_active_out1) true)
                                  true lappr_active_out1) true)
                          true lga_active_out1) true)
                  false true))
  (=> (= not1_out1_2 (ite (= nav_active_out1 true) false true))
  (=> (= not5_out1_2 (ite (= not1_out1_2 true) true nor_nav_out1))
  (=>
  (= nor_hdg_out1 (ite (= (ite (= (ite (= (ite (= roll_active_out1 true) true
                                          nav_active_out1) true)
                                  true lappr_active_out1) true)
                          true lga_active_out1) true)
                  false true))
  (=> (= not1_out1_3 (ite (= hdg_active_out1 true) false true))
  (=> (= not5_out1_3 (ite (= not1_out1_3 true) true nor_hdg_out1))
  (=>
  (= nor_roll_out1 (ite (= (ite (= (ite (= (ite (= hdg_active_out1 true) true
                                           nav_active_out1) true)
                                   true lappr_active_out1) true)
                           true lga_active_out1) true)
                   false true))
  (=> (= not1_out1_4 (ite (= roll_active_out1 true) false true))
  (=> (= not5_out1_4 (ite (= not1_out1_4 true) true nor_roll_out1))
  (=>
  (= and_out1 (ite (= (ite (= (ite (= (ite (= not5_out1_4 true) not5_out1_3
                                      false) true)
                              not5_out1_2 false) true)
                      not5_out1_1 false) true)
              not5_out1 false))
  (= and_out1 true)))))))))))))))))))))))))
(check-sat)
(exit)
