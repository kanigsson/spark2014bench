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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort e_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (e_type e_type) Bool)

(declare-const dummy e_type)

(declare-datatypes ((e_type__ref 0))
(((e_type__refqtmk (e_type__content e_type)))))
(define-fun e_type__ref_e_type__content__projection ((a e_type__ref)) e_type 
  (e_type__content a))

(declare-fun to_rep (e_type) Int)

(declare-fun of_rep (Int) e_type)

;; inversion_axiom
  (assert
  (forall ((x e_type)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x e_type)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test__c_type__e e_type)))))
(define-fun us_split_fields_rec__test__c_type__e__projection ((a us_split_fields)) e_type 
  (rec__test__c_type__e a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__test__c_type__e (us_split_fields1 a))) 
                   (to_rep (rec__test__c_type__e (us_split_fields1 b)))) true
                   false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test__c_type__e__first__bit Int)

(declare-const test__c_type__e__last__bit Int)

(declare-const test__c_type__e__position Int)

;; test__c_type__e__first__bit_axiom
  (assert (<= 0 test__c_type__e__first__bit))

;; test__c_type__e__last__bit_axiom
  (assert (< test__c_type__e__first__bit test__c_type__e__last__bit))

;; test__c_type__e__position_axiom
  (assert (<= 0 test__c_type__e__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((c_type__ref 0))
(((c_type__refqtmk (c_type__content us_rep)))))
(define-fun c_type__ref_c_type__content__projection ((a c_type__ref)) us_rep 
  (c_type__content a))

(declare-fun get_e (us_rep) Int)

(declare-fun get_e__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 1)) (in_range1 temp___expr_159)))

;; get_e__post_axiom
  (assert
  (forall ((c us_rep))
  (! (let ((result (get_e c)))
     (=> (get_e__function_guard result c) (dynamic_invariant result true
     false true true))) :pattern ((get_e c)) )))

;; get_e__def_axiom
  (assert
  (forall ((c us_rep))
  (! (= (get_e c) (to_rep (rec__test__c_type__e (us_split_fields1 c)))) :pattern (
  (get_e c)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(assert
;; defqtvc
 ;; File "test.ads", line 15, characters 0-0
  (not
  (forall ((o e_type) (c__split_fields e_type))
  (=> (get_e__function_guard
  (get_e (us_repqtmk (us_split_fieldsqtmk (of_rep 0))))
  (us_repqtmk (us_split_fieldsqtmk (of_rep 0))))
  (=> (get_e__function_guard
  (get_e (us_repqtmk (us_split_fieldsqtmk (of_rep 0))))
  (us_repqtmk (us_split_fieldsqtmk (of_rep 0))))
  (=> (= (to_rep o) 0)
  (=> (= c__split_fields o)
  (let ((o1 (us_repqtmk (us_split_fieldsqtmk c__split_fields))))
  (let ((o2 (get_e o1)))
  (=>
  (and (get_e__function_guard o2 o1)
  (and (dynamic_invariant o2 true false true true)
  (= o2 (to_rep c__split_fields)))) (not (= o2 0))))))))))))
(check-sat)
(exit)
