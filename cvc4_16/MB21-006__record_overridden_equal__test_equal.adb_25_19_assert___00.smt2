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

(declare-sort my_int 0)

(declare-fun my_intqtint (my_int) Int)

;; my_int'axiom
  (assert
  (forall ((i my_int)) (and (<= 0 (my_intqtint i)) (<= (my_intqtint i) 7))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (my_int my_int) Bool)

(declare-const dummy my_int)

(declare-datatypes ((my_int__ref 0))
(((my_int__refqtmk (my_int__content my_int)))))
(define-fun my_int__ref_my_int__content__projection ((a my_int__ref)) my_int 
  (my_int__content a))

(define-fun to_rep ((x my_int)) Int (my_intqtint x))

(declare-fun of_rep (Int) my_int)

;; inversion_axiom
  (assert
  (forall ((x my_int)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x my_int)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test_equal__my_int_mod__content my_int)))))
(define-fun us_split_fields_rec__test_equal__my_int_mod__content__projection ((a us_split_fields)) my_int 
  (rec__test_equal__my_int_mod__content a))

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
                           (rec__test_equal__my_int_mod__content
                           (us_split_fields1 a))) (to_rep
                                                  (rec__test_equal__my_int_mod__content
                                                  (us_split_fields1 b))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_equal__my_int_mod__content__first__bit Int)

(declare-const test_equal__my_int_mod__content__last__bit Int)

(declare-const test_equal__my_int_mod__content__position Int)

;; test_equal__my_int_mod__content__first__bit_axiom
  (assert (<= 0 test_equal__my_int_mod__content__first__bit))

;; test_equal__my_int_mod__content__last__bit_axiom
  (assert
  (< test_equal__my_int_mod__content__first__bit test_equal__my_int_mod__content__last__bit))

;; test_equal__my_int_mod__content__position_axiom
  (assert (<= 0 test_equal__my_int_mod__content__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((my_int_mod__ref 0))
(((my_int_mod__refqtmk (my_int_mod__content us_rep)))))
(define-fun my_int_mod__ref_my_int_mod__content__projection ((a my_int_mod__ref)) us_rep 
  (my_int_mod__content a))

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (and
     (forall ((a1 us_rep) (b1 us_rep)) (oeq__function_guard (oeq a1 b1) a1
     b1)) (= (user_eq1 a b) (oeq a b))) :pattern ((user_eq1 a b)) )))

;; oeq__post_axiom
  (assert true)

;; oeq__def_axiom
  (assert
  (forall ((x us_rep) (y us_rep))
  (! (= (= (oeq x y) true)
     (or
     (= (to_rep (rec__test_equal__my_int_mod__content (us_split_fields1 x))) 
     (to_rep (rec__test_equal__my_int_mod__content (us_split_fields1 y))))
     (ite (< (to_rep
             (rec__test_equal__my_int_mod__content (us_split_fields1 x))) 
     (to_rep (rec__test_equal__my_int_mod__content (us_split_fields1 y))))
     (= (- (to_rep
           (rec__test_equal__my_int_mod__content (us_split_fields1 y))) 
     (to_rep (rec__test_equal__my_int_mod__content (us_split_fields1 x)))) 4)
     (= (- (to_rep
           (rec__test_equal__my_int_mod__content (us_split_fields1 x))) 
     (to_rep (rec__test_equal__my_int_mod__content (us_split_fields1 y)))) 4)))) :pattern (
  (oeq x y)) )))

(declare-const content_x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const content_y us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__test_equal__my_rec__content us_rep)))))
(define-fun us_split_fields_rec__test_equal__my_rec__content__projection ((a us_split_fields2)) us_rep 
  (rec__test_equal__my_rec__content a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (user_eq1
                            (rec__test_equal__my_rec__content
                            (us_split_fields3 a))
                            (rec__test_equal__my_rec__content
                            (us_split_fields3 b))) true)
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_equal__my_rec__content__first__bit Int)

(declare-const test_equal__my_rec__content__last__bit Int)

(declare-const test_equal__my_rec__content__position Int)

;; test_equal__my_rec__content__first__bit_axiom
  (assert (<= 0 test_equal__my_rec__content__first__bit))

;; test_equal__my_rec__content__last__bit_axiom
  (assert
  (< test_equal__my_rec__content__first__bit test_equal__my_rec__content__last__bit))

;; test_equal__my_rec__content__position_axiom
  (assert (<= 0 test_equal__my_rec__content__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((my_rec__ref 0))
(((my_rec__refqtmk (my_rec__content us_rep1)))))
(define-fun my_rec__ref_my_rec__content__projection ((a my_rec__ref)) us_rep1 
  (my_rec__content a))

(declare-const x us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const y us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 0 7)) (in_range temp___expr_180)))

(declare-const rliteral my_int)

;; rliteral_axiom
  (assert (= (my_intqtint rliteral) 1))

;; content_x__def_axiom
  (assert (= content_x (us_repqtmk (us_split_fieldsqtmk rliteral))))

(declare-const rliteral1 my_int)

;; rliteral_axiom
  (assert (= (my_intqtint rliteral1) 5))

;; content_y__def_axiom
  (assert (= content_y (us_repqtmk (us_split_fieldsqtmk rliteral1))))

;; x__def_axiom
  (assert (= x (us_repqtmk1 (us_split_fieldsqtmk1 content_x))))

;; y__def_axiom
  (assert (= y (us_repqtmk1 (us_split_fieldsqtmk1 content_y))))

(assert
;; defqtvc
 ;; File "test_equal.adb", line 1, characters 0-0
  (not
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral)) content_x)
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral1)) content_y)
  (=> (= (us_repqtmk1 (us_split_fieldsqtmk1 content_x)) x)
  (=> (= (us_repqtmk1 (us_split_fieldsqtmk1 content_y)) y)
  (=> (oeq__function_guard (oeq content_x content_y) content_x content_y)
  (= (oeq content_x content_y) true))))))))
(check-sat)
(exit)
