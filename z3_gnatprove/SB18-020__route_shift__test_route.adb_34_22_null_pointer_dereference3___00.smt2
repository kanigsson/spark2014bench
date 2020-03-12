(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__test_route__point__x integer)(rec__test_route__point__y integer)))))
(define-fun us_split_fields_rec__test_route__point__x__projection ((a us_split_fields)) integer 
  (rec__test_route__point__x a))

(define-fun us_split_fields_rec__test_route__point__y__projection ((a us_split_fields)) integer 
  (rec__test_route__point__y a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__test_route__point__x (us_split_fields1 a))) 
                        (to_rep
                        (rec__test_route__point__x (us_split_fields1 b))))
                        (= (to_rep
                           (rec__test_route__point__y (us_split_fields1 a))) 
                        (to_rep
                        (rec__test_route__point__y (us_split_fields1 b)))))
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

(declare-const test_route__point__x__first__bit Int)

(declare-const test_route__point__x__last__bit Int)

(declare-const test_route__point__x__position Int)

;; test_route__point__x__first__bit_axiom
  (assert (<= 0 test_route__point__x__first__bit))

;; test_route__point__x__last__bit_axiom
  (assert
  (< test_route__point__x__first__bit test_route__point__x__last__bit))

;; test_route__point__x__position_axiom
  (assert (<= 0 test_route__point__x__position))

(declare-const test_route__point__y__first__bit Int)

(declare-const test_route__point__y__last__bit Int)

(declare-const test_route__point__y__position Int)

;; test_route__point__y__first__bit_axiom
  (assert (<= 0 test_route__point__y__first__bit))

;; test_route__point__y__last__bit_axiom
  (assert
  (< test_route__point__y__first__bit test_route__point__y__last__bit))

;; test_route__point__y__position_axiom
  (assert (<= 0 test_route__point__y__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((point__ref (point__refqtmk (point__content us_rep)))))
(define-fun point__ref_point__content__projection ((a point__ref)) us_rep 
  (point__content a))

(declare-sort us_main_type 0)

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (rec__test_route__route_acc__is_null_pointer Bool)(rec__test_route__route_acc__pointer_address Int)(rec__test_route__route_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__test_route__route_acc__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__test_route__route_acc__is_null_pointer a))

(define-fun us_rep_rec__test_route__route_acc__pointer_address__projection ((a us_rep1)) Int 
  (rec__test_route__route_acc__pointer_address a))

(define-fun us_rep_rec__test_route__route_acc__pointer_value_abstr__projection ((a us_rep1)) us_main_type 
  (rec__test_route__route_acc__pointer_value_abstr a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep1)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref)) us_rep1 
  (us_rep__content a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__test_route__route_acc__is_null_pointer a) 
                         (rec__test_route__route_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__test_route__route_acc__is_null_pointer a) true))
                         (and
                         (= (rec__test_route__route_acc__pointer_address a) 
                         (rec__test_route__route_acc__pointer_address b))
                         (= (rec__test_route__route_acc__pointer_value_abstr
                            a) (rec__test_route__route_acc__pointer_value_abstr
                               b)))))
                    true false))

(declare-const dummy3 us_rep1)

(declare-datatypes () ((t4b__ref (t4b__refqtmk (t4b__content us_rep1)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_rep1 
  (t4b__content a))

(declare-fun length (us_rep1) Int)

(declare-fun length__function_guard (Int us_rep1) Bool)

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (natural natural) Bool)

(declare-const dummy4 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun in_range3 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (rec__test_route__point_acc__is_null_pointer Bool)(rec__test_route__point_acc__pointer_address Int)(rec__test_route__point_acc__pointer_value us_rep)))))
(define-fun us_rep_rec__test_route__point_acc__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__test_route__point_acc__is_null_pointer a))

(define-fun us_rep_rec__test_route__point_acc__pointer_address__projection ((a us_rep2)) Int 
  (rec__test_route__point_acc__pointer_address a))

(define-fun us_rep_rec__test_route__point_acc__pointer_value__projection ((a us_rep2)) us_rep 
  (rec__test_route__point_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref1 (us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__test_route__point_acc__is_null_pointer a) 
                         (rec__test_route__point_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__test_route__point_acc__is_null_pointer a) true))
                         (and
                         (= (rec__test_route__point_acc__pointer_address a) 
                         (rec__test_route__point_acc__pointer_address b))
                         (= (rec__test_route__point_acc__pointer_value a) 
                         (rec__test_route__point_acc__pointer_value b)))))
                    true false))

(define-fun rec__test_route__point_acc__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__test_route__point_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_route__point_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy5 us_rep2)

(declare-datatypes ()
((point_acc__ref (point_acc__refqtmk (point_acc__content us_rep2)))))
(define-fun point_acc__ref_point_acc__content__projection ((a point_acc__ref)) us_rep2 
  (point_acc__content a))

(declare-const dummy6 us_rep1)

(declare-datatypes ()
((route_acc__ref (route_acc__refqtmk (route_acc__content us_rep1)))))
(define-fun route_acc__ref_route_acc__content__projection ((a route_acc__ref)) us_rep1 
  (route_acc__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__test_route__route__current us_rep2)(rec__test_route__route__rest us_rep1)))))
(define-fun us_split_fields_rec__test_route__route__current__projection ((a us_split_fields2)) us_rep2 
  (rec__test_route__route__current a))

(define-fun us_split_fields_rec__test_route__route__rest__projection ((a us_split_fields2)) us_rep1 
  (rec__test_route__route__rest a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep3 (us_repqtmk3 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep3)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (bool_eq2
                            (rec__test_route__route__current
                            (us_split_fields3 a))
                            (rec__test_route__route__current
                            (us_split_fields3 b))) true)
                         (= (bool_eq1
                            (rec__test_route__route__rest
                            (us_split_fields3 a))
                            (rec__test_route__route__rest
                            (us_split_fields3 b))) true))
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

(declare-const test_route__route__current__first__bit Int)

(declare-const test_route__route__current__last__bit Int)

(declare-const test_route__route__current__position Int)

;; test_route__route__current__first__bit_axiom
  (assert (<= 0 test_route__route__current__first__bit))

;; test_route__route__current__last__bit_axiom
  (assert
  (< test_route__route__current__first__bit test_route__route__current__last__bit))

;; test_route__route__current__position_axiom
  (assert (<= 0 test_route__route__current__position))

(declare-const test_route__route__rest__first__bit Int)

(declare-const test_route__route__rest__last__bit Int)

(declare-const test_route__route__rest__position Int)

;; test_route__route__rest__first__bit_axiom
  (assert (<= 0 test_route__route__rest__first__bit))

;; test_route__route__rest__last__bit_axiom
  (assert
  (< test_route__route__rest__first__bit test_route__route__rest__last__bit))

;; test_route__route__rest__position_axiom
  (assert (<= 0 test_route__route__rest__position))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-const dummy7 us_rep3)

(declare-datatypes ()
((route__ref (route__refqtmk (route__content us_rep3)))))
(define-fun route__ref_route__content__projection ((a route__ref)) us_rep3 
  (route__content a))

(declare-fun us_open (us_main_type) us_rep3)

(declare-fun us_close (us_rep3) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep3))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__test_route__route_acc__pointer_value ((a us_rep1)) us_rep3 
  (us_open (rec__test_route__route_acc__pointer_value_abstr a)))

(define-fun rec__test_route__route_acc__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__test_route__route_acc__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_route__route_acc__is_null_pointer us_null_pointer1) true))

(declare-fun temp___dynamic_invariant_222 (us_rep1 Bool Bool Bool Bool) Bool)

(define-fun dynamic_invariant2 ((temp___expr_221 us_rep1)
  (temp___is_init_217 Bool) (temp___skip_constant_218 Bool)
  (temp___do_toplevel_219 Bool)
  (temp___do_typ_inv_220 Bool)) Bool (=>
                                     (not
                                     (= (rec__test_route__route_acc__is_null_pointer
                                        temp___expr_221) true))
                                     (and
                                     (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        (rec__test_route__route__current
                                        (us_split_fields3
                                        (rec__test_route__route_acc__pointer_value
                                        temp___expr_221)))) true))
                                     (temp___dynamic_invariant_222
                                     (rec__test_route__route__rest
                                     (us_split_fields3
                                     (rec__test_route__route_acc__pointer_value
                                     temp___expr_221))) true false true
                                     temp___do_typ_inv_220))))

;; def_axiom
  (assert
  (forall ((temp___expr_227 us_rep1))
  (forall ((temp___is_init_223 Bool) (temp___skip_constant_224 Bool)
  (temp___do_toplevel_225 Bool) (temp___do_typ_inv_226 Bool))
  (! (= (temp___dynamic_invariant_222 temp___expr_227 temp___is_init_223
     temp___skip_constant_224 temp___do_toplevel_225 temp___do_typ_inv_226)
     (=>
     (not
     (= (rec__test_route__route_acc__is_null_pointer temp___expr_227) true))
     (and
     (not
     (= (rec__test_route__point_acc__is_null_pointer
        (rec__test_route__route__current
        (us_split_fields3
        (rec__test_route__route_acc__pointer_value temp___expr_227)))) true))
     (temp___dynamic_invariant_222
     (rec__test_route__route__rest
     (us_split_fields3
     (rec__test_route__route_acc__pointer_value temp___expr_227))) true false
     true temp___do_typ_inv_226)))) :pattern ((temp___dynamic_invariant_222
  temp___expr_227 temp___is_init_223 temp___skip_constant_224
  temp___do_toplevel_225 temp___do_typ_inv_226)) ))))

(define-fun default_initial_assumption ((temp___expr_228 us_rep1)
  (temp___skip_top_level_229 Bool)) Bool (= (rec__test_route__route_acc__is_null_pointer
                                            temp___expr_228) true))

(define-fun dynamic_invariant3 ((temp___expr_234 us_rep3)
  (temp___is_init_230 Bool) (temp___skip_constant_231 Bool)
  (temp___do_toplevel_232 Bool)
  (temp___do_typ_inv_233 Bool)) Bool (and
                                     (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        (rec__test_route__route__current
                                        (us_split_fields3 temp___expr_234))) true))
                                     (=>
                                     (not
                                     (= (rec__test_route__route_acc__is_null_pointer
                                        (rec__test_route__route__rest
                                        (us_split_fields3 temp___expr_234))) true))
                                     (and
                                     (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        (rec__test_route__route__current
                                        (us_split_fields3
                                        (rec__test_route__route_acc__pointer_value
                                        (rec__test_route__route__rest
                                        (us_split_fields3 temp___expr_234)))))) true))
                                     (temp___dynamic_invariant_222
                                     (rec__test_route__route__rest
                                     (us_split_fields3
                                     (rec__test_route__route_acc__pointer_value
                                     (rec__test_route__route__rest
                                     (us_split_fields3 temp___expr_234)))))
                                     true false true temp___do_typ_inv_233)))))

(define-fun default_initial_assumption1 ((temp___expr_235 us_rep3)
  (temp___skip_top_level_236 Bool)) Bool (and
                                         (= (rec__test_route__point_acc__is_null_pointer
                                            (rec__test_route__route__current
                                            (us_split_fields3
                                            temp___expr_235))) true)
                                         (= (rec__test_route__route_acc__is_null_pointer
                                            (rec__test_route__route__rest
                                            (us_split_fields3
                                            temp___expr_235))) true)))

;; length__def_axiom
  (assert
  (forall ((r us_rep1))
  (! (=>
     (=> (not (= (rec__test_route__route_acc__is_null_pointer r) true))
     (dynamic_invariant3 (rec__test_route__route_acc__pointer_value r) true
     false true true))
     (= (length r) (ite (= (bool_eq1 r us_null_pointer1) true) 0
                   (+ (min 2147483646
                      (length
                      (rec__test_route__route__rest
                      (us_split_fields3
                      (rec__test_route__route_acc__pointer_value r))))) 1)))) :pattern (
  (length r)) )))

(declare-const dummy8 us_rep1)

(declare-datatypes () ((t5b__ref (t5b__refqtmk (t5b__content us_rep1)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_rep1 
  (t5b__content a))

(declare-const r us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun nth_x (us_rep1 Int) Int)

(declare-fun nth_x__function_guard (Int us_rep1 Int) Bool)

;; nth_x__def_axiom
  (assert
  (forall ((r1 us_rep1))
  (forall ((n1 Int))
  (! (=>
     (and
     (=> (not (= (rec__test_route__route_acc__is_null_pointer r1) true))
     (dynamic_invariant3 (rec__test_route__route_acc__pointer_value r1) true
     false true true)) (dynamic_invariant n1 true true true true))
     (= (nth_x r1 n1) (ite (= n1 1)
                      (to_rep
                      (rec__test_route__point__x
                      (us_split_fields1
                      (rec__test_route__point_acc__pointer_value
                      (rec__test_route__route__current
                      (us_split_fields3
                      (rec__test_route__route_acc__pointer_value r1)))))))
                      (nth_x
                      (rec__test_route__route__rest
                      (us_split_fields3
                      (rec__test_route__route_acc__pointer_value r1)))
                      (- n1 1))))) :pattern ((nth_x r1 n1)) ))))

(define-fun dynamic_invariant5 ((temp___expr_214 us_rep2)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (not
                                     (= (rec__test_route__point_acc__is_null_pointer
                                        temp___expr_214) true)))

(define-fun default_initial_assumption2 ((temp___expr_215 us_rep2)
  (temp___skip_top_level_216 Bool)) Bool (= (rec__test_route__point_acc__is_null_pointer
                                            temp___expr_215) true))

;; length__post_axiom
  (assert
  (forall ((r1 us_rep1))
  (! (=>
     (=> (not (= (rec__test_route__route_acc__is_null_pointer r1) true))
     (dynamic_invariant3 (rec__test_route__route_acc__pointer_value r1) true
     false true true)) (dynamic_invariant1 (length r1) true false true true)) :pattern (
  (length r1)) )))

;; Assume
  (assert
  (=> (not (= (rec__test_route__route_acc__is_null_pointer r) true))
  (dynamic_invariant3 (rec__test_route__route_acc__pointer_value r) true
  false true true)))

;; Assume
  (assert (dynamic_invariant n true false true true))

;; Assume
  (assert (<= n (length r)))

;; H
  (assert (= n 1))

(define-fun o () us_rep1 r)

(assert
;; defqtvc
 ;; File "test_route.adb", line 33, characters 0-0
  (not (rec__test_route__route_acc__pointer_value__pred o)))
(check-sat)
