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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__foo__context_type__x natural)))))
(define-fun us_split_fields_rec__foo__context_type__x__projection ((a us_split_fields)) natural 
  (rec__foo__context_type__x a))

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
                           (rec__foo__context_type__x (us_split_fields1 a))) 
                   (to_rep (rec__foo__context_type__x (us_split_fields1 b))))
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

(declare-const foo__context_type__x__first__bit Int)

(declare-const foo__context_type__x__last__bit Int)

(declare-const foo__context_type__x__position Int)

;; foo__context_type__x__first__bit_axiom
  (assert (<= 0 foo__context_type__x__first__bit))

;; foo__context_type__x__last__bit_axiom
  (assert
  (< foo__context_type__x__first__bit foo__context_type__x__last__bit))

;; foo__context_type__x__position_axiom
  (assert (<= 0 foo__context_type__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((context_type__ref 0))
(((context_type__refqtmk (context_type__content us_rep)))))
(define-fun context_type__ref_context_type__content__projection ((a context_type__ref)) us_rep 
  (context_type__content a))

(declare-datatypes ((element_context_type__ref 0))
(((element_context_type__refqtmk (element_context_type__content us_rep)))))
(define-fun element_context_type__ref_element_context_type__content__projection ((a element_context_type__ref)) us_rep 
  (element_context_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun valid_x (Int) Bool)

(declare-fun valid_x__function_guard (Bool Int) Bool)

;; temp___result_173'def
  (assert
  (forall ((temp___172 us_rep)) (valid_x__function_guard
  (valid_x
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___172))))
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___172))))))

(define-fun dynamic_predicate ((temp___171 us_rep)) Bool (= (valid_x
                                                            (to_rep
                                                            (rec__foo__context_type__x
                                                            (us_split_fields1
                                                            temp___171)))) true))

(declare-fun valid (us_rep) Bool)

(declare-fun valid__function_guard (Bool us_rep) Bool)

;; temp___result_164'def
  (assert
  (forall ((temp___163 us_rep)) (valid_x__function_guard
  (valid_x
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___163))))
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___163))))))

(define-fun dynamic_invariant ((temp___expr_162 us_rep)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=> (= temp___do_toplevel_160 true)
                                     (=> (= temp___is_init_158 true)
                                     (= (valid_x
                                        (to_rep
                                        (rec__foo__context_type__x
                                        (us_split_fields1 temp___expr_162)))) true))))

;; temp___result_170'def
  (assert
  (forall ((temp___169 us_rep)) (valid_x__function_guard
  (valid_x
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___169))))
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___169))))))

(define-fun dynamic_predicate1 ((temp___168 us_rep)) Bool (= (valid_x
                                                             (to_rep
                                                             (rec__foo__context_type__x
                                                             (us_split_fields1
                                                             temp___168)))) true))

;; valid__post_axiom
  (assert true)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; valid_x__post_axiom
  (assert true)

;; valid_x__def_axiom
  (assert
  (forall ((x Int))
  (! (= (= (valid_x x) true) (< 10 x)) :pattern ((valid_x x)) )))

(assert
;; defqtvc
 ;; File "generic_bar.ads", line 9, characters 0-0
  (not
  (forall ((foo__initialize__context__fields natural)
  (context__split_fields natural))
  (=>
  (forall ((context__split_fields1 natural)) (valid_x__function_guard
  (valid_x (to_rep context__split_fields1)) (to_rep context__split_fields1)))
  (=>
  (forall ((context__split_fields1 natural)) (valid_x__function_guard
  (valid_x (to_rep context__split_fields1)) (to_rep context__split_fields1)))
  (=>
  (forall ((foo__initialize__context__fields1 natural))
  (valid__function_guard
  (valid
  (us_repqtmk (us_split_fieldsqtmk foo__initialize__context__fields1)))
  (us_repqtmk (us_split_fieldsqtmk foo__initialize__context__fields1))))
  (=>
  (= (valid
     (us_repqtmk (us_split_fieldsqtmk foo__initialize__context__fields))) true)
  (=> (dynamic_invariant
  (us_repqtmk (us_split_fieldsqtmk foo__initialize__context__fields)) true
  true true true)
  (=> (= context__split_fields foo__initialize__context__fields)
  (dynamic_predicate
  (us_repqtmk (us_split_fieldsqtmk context__split_fields))))))))))))
(check-sat)
(exit)
