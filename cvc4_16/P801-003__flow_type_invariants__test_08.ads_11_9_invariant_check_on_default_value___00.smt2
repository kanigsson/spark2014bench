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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test_08__t2__n integer)))))
(define-fun us_split_fields_rec__test_08__t2__n__projection ((a us_split_fields)) integer 
  (rec__test_08__t2__n a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__test_08__t2__n (us_split_fields1 a))) 
                   (to_rep (rec__test_08__t2__n (us_split_fields1 b)))) true
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

(declare-const test_08__t2__n__first__bit Int)

(declare-const test_08__t2__n__last__bit Int)

(declare-const test_08__t2__n__position Int)

;; test_08__t2__n__first__bit_axiom
  (assert (<= 0 test_08__t2__n__first__bit))

;; test_08__t2__n__last__bit_axiom
  (assert (< test_08__t2__n__first__bit test_08__t2__n__last__bit))

;; test_08__t2__n__position_axiom
  (assert (<= 0 test_08__t2__n__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((t2__ref 0))
(((t2__refqtmk (t2__content us_rep)))))
(define-fun t2__ref_t2__content__projection ((a t2__ref)) us_rep (t2__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun is_positive_bad (Int) Bool)

(declare-fun is_positive_bad__function_guard (Bool Int) Bool)

;; is_positive_bad__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant n true true true true)
     (let ((result (is_positive_bad n)))
     (=> (is_positive_bad__function_guard result n)
     (= (= result true) (<= 1 n))))) :pattern ((is_positive_bad n)) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__test_08__t1__n integer)))))
(define-fun us_split_fields_rec__test_08__t1__n__projection ((a us_split_fields2)) integer 
  (rec__test_08__t1__n a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (to_rep
                            (rec__test_08__t1__n (us_split_fields3 a))) 
                    (to_rep (rec__test_08__t1__n (us_split_fields3 b)))) true
                    false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_08__t1__n__first__bit Int)

(declare-const test_08__t1__n__last__bit Int)

(declare-const test_08__t1__n__position Int)

;; test_08__t1__n__first__bit_axiom
  (assert (<= 0 test_08__t1__n__first__bit))

;; test_08__t1__n__last__bit_axiom
  (assert (< test_08__t1__n__first__bit test_08__t1__n__last__bit))

;; test_08__t1__n__position_axiom
  (assert (<= 0 test_08__t1__n__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((t1__ref 0))
(((t1__refqtmk (t1__content us_rep1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) us_rep1 (t1__content
                                                                  a))

(declare-fun is_positive_good (Int) Bool)

(declare-fun is_positive_good__function_guard (Bool Int) Bool)

;; is_positive_good__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant n true true true true)
     (let ((result (is_positive_good n)))
     (=> (is_positive_good__function_guard result n)
     (= (= result true) (<= 1 n))))) :pattern ((is_positive_good n)) )))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2 (rec__test_08__t3__n integer)))))
(define-fun us_split_fields_rec__test_08__t3__n__projection ((a us_split_fields4)) integer 
  (rec__test_08__t3__n a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (= (to_rep
                            (rec__test_08__t3__n (us_split_fields5 a))) 
                    (to_rep (rec__test_08__t3__n (us_split_fields5 b)))) true
                    false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const test_08__t3__n__first__bit Int)

(declare-const test_08__t3__n__last__bit Int)

(declare-const test_08__t3__n__position Int)

;; test_08__t3__n__first__bit_axiom
  (assert (<= 0 test_08__t3__n__first__bit))

;; test_08__t3__n__last__bit_axiom
  (assert (< test_08__t3__n__first__bit test_08__t3__n__last__bit))

;; test_08__t3__n__position_axiom
  (assert (<= 0 test_08__t3__n__position))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ((t3__ref 0))
(((t3__refqtmk (t3__content us_rep2)))))
(define-fun t3__ref_t3__content__projection ((a t3__ref)) us_rep2 (t3__content
                                                                  a))

(declare-fun is_positive_ugly (Int) Bool)

(declare-fun is_positive_ugly__function_guard (Bool Int) Bool)

;; is_positive_ugly__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant n true true true true)
     (let ((result (is_positive_ugly n)))
     (=> (is_positive_ugly__function_guard result n)
     (= (= result true) (<= 1 n))))) :pattern ((is_positive_ugly n)) )))

(define-fun default_initial_assumption ((temp___expr_162 us_rep1)
  (temp___skip_top_level_163 Bool)) Bool (= (to_rep
                                            (rec__test_08__t1__n
                                            (us_split_fields3
                                            temp___expr_162))) 42))

;; temp___result_166'def
  (assert
  (forall ((temp___165 us_rep1)) (is_positive_good__function_guard
  (is_positive_good
  (to_rep (rec__test_08__t1__n (us_split_fields3 temp___165))))
  (to_rep (rec__test_08__t1__n (us_split_fields3 temp___165))))))

(define-fun type_invariant ((temp___164 us_rep1)) Bool (or
                                                       (= (is_positive_good
                                                          (to_rep
                                                          (rec__test_08__t1__n
                                                          (us_split_fields3
                                                          temp___164)))) true)
                                                       (= (to_rep
                                                          (rec__test_08__t1__n
                                                          (us_split_fields3
                                                          temp___164))) (- 5))))

(define-fun default_initial_assumption1 ((temp___expr_172 us_rep)
  (temp___skip_top_level_173 Bool)) Bool (= (to_rep
                                            (rec__test_08__t2__n
                                            (us_split_fields1
                                            temp___expr_172))) 42))

;; temp___result_176'def
  (assert
  (forall ((temp___175 us_rep)) (is_positive_bad__function_guard
  (is_positive_bad
  (to_rep (rec__test_08__t2__n (us_split_fields1 temp___175))))
  (to_rep (rec__test_08__t2__n (us_split_fields1 temp___175))))))

(define-fun type_invariant1 ((temp___174 us_rep)) Bool (or
                                                       (= (is_positive_bad
                                                          (to_rep
                                                          (rec__test_08__t2__n
                                                          (us_split_fields1
                                                          temp___174)))) true)
                                                       (= (to_rep
                                                          (rec__test_08__t2__n
                                                          (us_split_fields1
                                                          temp___174))) (- 5))))

(define-fun default_initial_assumption2 ((temp___expr_182 us_rep2)
  (temp___skip_top_level_183 Bool)) Bool (= (to_rep
                                            (rec__test_08__t3__n
                                            (us_split_fields5
                                            temp___expr_182))) 42))

;; temp___result_186'def
  (assert
  (forall ((temp___185 us_rep2)) (is_positive_ugly__function_guard
  (is_positive_ugly
  (to_rep (rec__test_08__t3__n (us_split_fields5 temp___185))))
  (to_rep (rec__test_08__t3__n (us_split_fields5 temp___185))))))

(define-fun type_invariant2 ((temp___184 us_rep2)) Bool (or
                                                        (= (is_positive_ugly
                                                           (to_rep
                                                           (rec__test_08__t3__n
                                                           (us_split_fields5
                                                           temp___184)))) true)
                                                        (= (to_rep
                                                           (rec__test_08__t3__n
                                                           (us_split_fields5
                                                           temp___184))) (- 5))))

(assert
;; defqtvc
 ;; File "test_08.ads", line 3, characters 0-0
  (not
  (forall ((usf integer))
  (=> (= (to_rep usf) 42) (type_invariant
  (us_repqtmk1 (us_split_fieldsqtmk1 usf)))))))
(check-sat)
(exit)
