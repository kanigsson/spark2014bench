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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun f1 (Int) Int)

(declare-fun f1__function_guard (Int Int) Bool)

;; f1__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (f1 x)))
     (=> (f1__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((f1 x)) )))

;; f1__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (f1 x) x)) :pattern (
  (f1 x)) )))

(declare-fun f2 (Int Int) Int)

(declare-fun f2__function_guard (Int Int Int) Bool)

;; f2__post_axiom
  (assert
  (forall ((x Int) (info_flow_tests__test_05__a Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant
     info_flow_tests__test_05__a true true true true))
     (let ((result (f2 x info_flow_tests__test_05__a)))
     (=> (f2__function_guard result x info_flow_tests__test_05__a)
     (dynamic_invariant result true false true true)))) :pattern ((f2 x
                                                                  info_flow_tests__test_05__a)) )))

;; f2__def_axiom
  (assert
  (forall ((x Int) (info_flow_tests__test_05__a Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant
     info_flow_tests__test_05__a true true true true))
     (= (f2 x info_flow_tests__test_05__a) (+ info_flow_tests__test_05__a x))) :pattern (
  (f2 x info_flow_tests__test_05__a)) )))

(declare-fun f3 (Int Int) Int)

(declare-fun f3__function_guard (Int Int Int) Bool)

;; f3__post_axiom
  (assert
  (forall ((x Int) (info_flow_tests__test_05__a Int))
  (! (=>
     (and
     (and (dynamic_invariant x true true true true) (dynamic_invariant
     info_flow_tests__test_05__a true true true true))
     (<= 0 info_flow_tests__test_05__a))
     (let ((result (f3 x info_flow_tests__test_05__a)))
     (=> (f3__function_guard result x info_flow_tests__test_05__a)
     (dynamic_invariant result true false true true)))) :pattern ((f3 x
                                                                  info_flow_tests__test_05__a)) )))

;; f3__def_axiom
  (assert
  (forall ((x Int) (info_flow_tests__test_05__a Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant
     info_flow_tests__test_05__a true true true true))
     (= (f3 x info_flow_tests__test_05__a) x)) :pattern ((f3 x
                                                         info_flow_tests__test_05__a)) )))

(declare-fun f4 (Int Int) Int)

(declare-fun f4__function_guard (Int Int Int) Bool)

;; f4__post_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true)) (< 0 y))
     (let ((result (f4 x y)))
     (=> (f4__function_guard result x y)
     (and (< 0 y) (dynamic_invariant result true false true true))))) :pattern (
  (f4 x y)) )))

;; f4__def_axiom
  (assert
  (forall ((x Int) (y Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant y true
     true true true)) (= (f4 x y) x)) :pattern ((f4 x y)) )))

(declare-const c1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const c3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const c5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const c6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const c7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

;; c1__def_axiom
  (assert (= c1 5))

;; c2__def_axiom
  (assert (and (f1__function_guard (f1 5) 5) (= c2 (f1 5))))

;; c6__def_axiom
  (assert (and (f4__function_guard (f4 5 c3) 5 c3) (= c6 (f4 5 c3))))

;; c7__def_axiom
  (assert (and (f4__function_guard (f4 c3 c4) c3 c4) (= c7 (f4 c3 c4))))

(assert
;; defqtvc
 ;; File "info_flow_tests.adb", line 99, characters 0-0
  (not
  (forall ((a Int))
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant c1 true false true true)
  (let ((info_flow_tests__test_05__c2__assume (f1 5)))
  (=>
  (and (f1__function_guard info_flow_tests__test_05__c2__assume 5)
  (and (dynamic_invariant info_flow_tests__test_05__c2__assume true false
  true true) (= info_flow_tests__test_05__c2__assume 5)))
  (=> (= info_flow_tests__test_05__c2__assume c2)
  (=> (dynamic_invariant c2 true false true true)
  (let ((info_flow_tests__test_05__c3__assume (f2 5 a)))
  (=>
  (and (f2__function_guard info_flow_tests__test_05__c3__assume 5 a)
  (and (dynamic_invariant info_flow_tests__test_05__c3__assume true false
  true true) (= info_flow_tests__test_05__c3__assume (+ a 5))))
  (=> (= info_flow_tests__test_05__c3__assume c3)
  (=> (dynamic_invariant c3 true false true true) (<= 0 a))))))))))))))
(check-sat)
(exit)
