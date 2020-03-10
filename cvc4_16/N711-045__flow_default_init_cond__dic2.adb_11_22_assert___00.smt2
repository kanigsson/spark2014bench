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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (t t) Bool)

(declare-const dummy t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun to_rep ((x t)) Int (tqtint x))

(declare-fun of_rep (Int) t)

;; inversion_axiom
  (assert
  (forall ((x t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert (forall ((x t)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort u 0)

(declare-fun uqtint (u) Int)

;; u'axiom
  (assert
  (forall ((i u))
  (and (<= (- 2147483648) (uqtint i)) (<= (uqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (u u) Bool)

(declare-const dummy1 u)

(declare-datatypes ((u__ref 0))
(((u__refqtmk (u__content u)))))
(define-fun u__ref_u__content__projection ((a u__ref)) u (u__content a))

(define-fun to_rep1 ((x u)) Int (uqtint x))

(declare-fun of_rep1 (Int) u)

;; inversion_axiom
  (assert
  (forall ((x u)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x u)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__dic2__r__x t)(rec__dic2__r__y u)))))
(define-fun us_split_fields_rec__dic2__r__x__projection ((a us_split_fields)) t 
  (rec__dic2__r__x a))

(define-fun us_split_fields_rec__dic2__r__y__projection ((a us_split_fields)) u 
  (rec__dic2__r__y a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep (rec__dic2__r__x (us_split_fields1 a))) 
                        (to_rep (rec__dic2__r__x (us_split_fields1 b))))
                        (= (to_rep1 (rec__dic2__r__y (us_split_fields1 a))) 
                        (to_rep1 (rec__dic2__r__y (us_split_fields1 b)))))
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

(declare-const dic2__r__x__first__bit Int)

(declare-const dic2__r__x__last__bit Int)

(declare-const dic2__r__x__position Int)

;; dic2__r__x__first__bit_axiom
  (assert (<= 0 dic2__r__x__first__bit))

;; dic2__r__x__last__bit_axiom
  (assert (< dic2__r__x__first__bit dic2__r__x__last__bit))

;; dic2__r__x__position_axiom
  (assert (<= 0 dic2__r__x__position))

(declare-const dic2__r__y__first__bit Int)

(declare-const dic2__r__y__last__bit Int)

(declare-const dic2__r__y__position Int)

;; dic2__r__y__first__bit_axiom
  (assert (<= 0 dic2__r__y__first__bit))

;; dic2__r__y__last__bit_axiom
  (assert (< dic2__r__y__first__bit dic2__r__y__last__bit))

;; dic2__r__y__position_axiom
  (assert (<= 0 dic2__r__y__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun foo (Int) Bool)

(declare-fun foo__function_guard (Bool Int) Bool)

(declare-fun bar (Int) Bool)

(declare-fun bar__function_guard (Bool Int) Bool)

;; temp___result_183'def
  (assert
  (forall ((temp___182 t)) (foo__function_guard (foo (to_rep temp___182))
  (to_rep temp___182))))

;; temp___result_186'def
  (assert
  (forall ((temp___185 u)) (bar__function_guard (bar (to_rep1 temp___185))
  (to_rep1 temp___185))))

(define-fun default_initial_assumption ((temp___expr_179 us_rep)
  (temp___skip_top_level_180 Bool)) Bool (and
                                         (let ((temp___181 (rec__dic2__r__x
                                                           (us_split_fields1
                                                           temp___expr_179))))
                                         (and (= (to_rep temp___181) 0)
                                         (= (foo (to_rep temp___181)) true)))
                                         (let ((temp___184 (rec__dic2__r__y
                                                           (us_split_fields1
                                                           temp___expr_179))))
                                         (and (= (to_rep1 temp___184) 1)
                                         (= (bar (to_rep1 temp___184)) true)))))

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_160)))

;; temp___result_164'def
  (assert
  (forall ((temp___163 Int)) (foo__function_guard (foo temp___163)
  temp___163)))

(define-fun default_initial_assumption1 ((temp___expr_161 Int)
  (temp___skip_top_level_162 Bool)) Bool (and (= temp___expr_161 0)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_162 true))
                                         (= (foo temp___expr_161) true))))

(define-fun dynamic_invariant1 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_169)))

;; temp___result_173'def
  (assert
  (forall ((temp___172 Int)) (bar__function_guard (bar temp___172)
  temp___172)))

(define-fun default_initial_assumption2 ((temp___expr_170 Int)
  (temp___skip_top_level_171 Bool)) Bool (and (= temp___expr_170 1)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_171 true))
                                         (= (bar temp___expr_170) true))))

;; foo__post_axiom
  (assert true)

;; foo__def_axiom
  (assert
  (forall ((par1 Int))
  (! (= (= (foo par1) true) (= par1 0)) :pattern ((foo par1)) )))

;; bar__post_axiom
  (assert true)

;; bar__def_axiom
  (assert
  (forall ((par1 Int))
  (! (= (= (bar par1) true) (= par1 1)) :pattern ((bar par1)) )))

(assert
;; defqtvc
 ;; File "dic2.ads", line 17, characters 0-0
  (not
  (forall ((t_var Int) (u_var Int) (r_var__split_fields us_split_fields))
  (=> (default_initial_assumption1 t_var false)
  (=> (dynamic_invariant t_var false false true true)
  (=> (default_initial_assumption2 u_var false)
  (=> (dynamic_invariant1 u_var false false true true)
  (=> (default_initial_assumption (us_repqtmk r_var__split_fields) false)
  (= t_var (to_rep (rec__dic2__r__x r_var__split_fields)))))))))))
(check-sat)
(exit)
