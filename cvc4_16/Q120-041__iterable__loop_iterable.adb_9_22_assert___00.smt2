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

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy1 (Array Int natural))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq1 ((Array Int natural) (Array Int natural)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__composite_cursors__cont1__content (Array Int natural))(rec__composite_cursors__cont1__length natural)))))
(define-fun us_split_fields_rec__composite_cursors__cont1__content__projection ((a us_split_fields)) (Array Int natural) 
  (rec__composite_cursors__cont1__content a))

(define-fun us_split_fields_rec__composite_cursors__cont1__length__projection ((a us_split_fields)) natural 
  (rec__composite_cursors__cont1__length a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__composite_cursors__cont1__content
                           (us_split_fields1 a)) 1 100
                           (rec__composite_cursors__cont1__content
                           (us_split_fields1 b)) 1 100) true)
                        (= (to_rep
                           (rec__composite_cursors__cont1__length
                           (us_split_fields1 a))) (to_rep
                                                  (rec__composite_cursors__cont1__length
                                                  (us_split_fields1 b)))))
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

(declare-const composite_cursors__cont1__content__first__bit Int)

(declare-const composite_cursors__cont1__content__last__bit Int)

(declare-const composite_cursors__cont1__content__position Int)

;; composite_cursors__cont1__content__first__bit_axiom
  (assert (<= 0 composite_cursors__cont1__content__first__bit))

;; composite_cursors__cont1__content__last__bit_axiom
  (assert
  (< composite_cursors__cont1__content__first__bit composite_cursors__cont1__content__last__bit))

;; composite_cursors__cont1__content__position_axiom
  (assert (<= 0 composite_cursors__cont1__content__position))

(declare-const composite_cursors__cont1__length__first__bit Int)

(declare-const composite_cursors__cont1__length__last__bit Int)

(declare-const composite_cursors__cont1__length__position Int)

;; composite_cursors__cont1__length__first__bit_axiom
  (assert (<= 0 composite_cursors__cont1__length__first__bit))

;; composite_cursors__cont1__length__last__bit_axiom
  (assert
  (< composite_cursors__cont1__length__first__bit composite_cursors__cont1__length__last__bit))

;; composite_cursors__cont1__length__position_axiom
  (assert (<= 0 composite_cursors__cont1__length__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((cont1__ref 0))
(((cont1__refqtmk (cont1__content us_rep)))))
(define-fun cont1__ref_cont1__content__projection ((a cont1__ref)) us_rep 
  (cont1__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_196 us_rep)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=> (= temp___do_toplevel_194 true)
                                     (=> (= temp___is_init_192 true)
                                     (<= (to_rep
                                         (rec__composite_cursors__cont1__length
                                         (us_split_fields1 temp___expr_196))) 100))))

(define-fun dynamic_predicate ((temp___205 us_rep)) Bool (<= (to_rep
                                                             (rec__composite_cursors__cont1__length
                                                             (us_split_fields1
                                                             temp___205))) 100))

(declare-const dummy3 (Array Int natural))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq3 ((Array Int natural) (Array Int natural)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__composite_cursors__cont2__content (Array Int natural))(rec__composite_cursors__cont2__length natural)))))
(define-fun us_split_fields_rec__composite_cursors__cont2__content__projection ((a us_split_fields2)) (Array Int natural) 
  (rec__composite_cursors__cont2__content a))

(define-fun us_split_fields_rec__composite_cursors__cont2__length__projection ((a us_split_fields2)) natural 
  (rec__composite_cursors__cont2__length a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq
                            (rec__composite_cursors__cont2__content
                            (us_split_fields3 a)) 1 100
                            (rec__composite_cursors__cont2__content
                            (us_split_fields3 b)) 1 100) true)
                         (= (to_rep
                            (rec__composite_cursors__cont2__length
                            (us_split_fields3 a))) (to_rep
                                                   (rec__composite_cursors__cont2__length
                                                   (us_split_fields3 b)))))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const composite_cursors__cont2__content__first__bit Int)

(declare-const composite_cursors__cont2__content__last__bit Int)

(declare-const composite_cursors__cont2__content__position Int)

;; composite_cursors__cont2__content__first__bit_axiom
  (assert (<= 0 composite_cursors__cont2__content__first__bit))

;; composite_cursors__cont2__content__last__bit_axiom
  (assert
  (< composite_cursors__cont2__content__first__bit composite_cursors__cont2__content__last__bit))

;; composite_cursors__cont2__content__position_axiom
  (assert (<= 0 composite_cursors__cont2__content__position))

(declare-const composite_cursors__cont2__length__first__bit Int)

(declare-const composite_cursors__cont2__length__last__bit Int)

(declare-const composite_cursors__cont2__length__position Int)

;; composite_cursors__cont2__length__first__bit_axiom
  (assert (<= 0 composite_cursors__cont2__length__first__bit))

;; composite_cursors__cont2__length__last__bit_axiom
  (assert
  (< composite_cursors__cont2__length__first__bit composite_cursors__cont2__length__last__bit))

;; composite_cursors__cont2__length__position_axiom
  (assert (<= 0 composite_cursors__cont2__length__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((cont2__ref 0))
(((cont2__refqtmk (cont2__content us_rep1)))))
(define-fun cont2__ref_cont2__content__projection ((a cont2__ref)) us_rep1 
  (cont2__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_211 us_rep1)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=> (= temp___do_toplevel_209 true)
                                     (=> (= temp___is_init_207 true)
                                     (<= (to_rep
                                         (rec__composite_cursors__cont2__length
                                         (us_split_fields3 temp___expr_211))) 100))))

(define-fun dynamic_predicate1 ((temp___220 us_rep1)) Bool (<= (to_rep
                                                               (rec__composite_cursors__cont2__length
                                                               (us_split_fields3
                                                               temp___220))) 100))

(declare-fun first (us_rep) (Array Int natural))

(declare-fun first__function_guard ((Array Int natural) us_rep) Bool)

(declare-fun temp_____aggregate_def_233 (Int) (Array Int natural))

;; first__post_axiom
  (assert true)

;; first__def_axiom
  (assert
  (forall ((c us_rep))
  (! (=> (dynamic_invariant c true true true true)
     (= (first c) (temp_____aggregate_def_233 1))) :pattern ((first c)) )))

(declare-fun has_element (us_rep (Array Int natural)) Bool)

(declare-fun has_element__function_guard (Bool us_rep
  (Array Int natural)) Bool)

;; has_element__post_axiom
  (assert true)

;; has_element__def_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p (Array Int natural)))
  (! (= (= (has_element c p) true)
     (let ((temp___245 (to_rep (select p 1))))
     (and (<= 1 temp___245)
     (<= temp___245 (to_rep
                    (rec__composite_cursors__cont1__length
                    (us_split_fields1 c))))))) :pattern ((has_element c p)) ))))

(declare-fun next (us_rep (Array Int natural)) (Array Int natural))

(declare-fun next__function_guard ((Array Int natural) us_rep
  (Array Int natural)) Bool)

(declare-fun temp_____aggregate_def_248 (Int) (Array Int natural))

;; next__post_axiom
  (assert
  (forall ((c us_rep) (p (Array Int natural))) (has_element__function_guard
  (has_element c p) c p)))

;; next__def_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p (Array Int natural)))
  (! (=> (dynamic_invariant c true true true true)
     (= (next c p) (temp_____aggregate_def_248 (+ (to_rep (select p 1)) 1)))) :pattern (
  (next c p)) ))))

(declare-fun element (us_rep (Array Int natural)) Int)

(declare-fun element__function_guard (Int us_rep (Array Int natural)) Bool)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; element__post_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p (Array Int natural)))
  (! (and
     (forall ((c1 us_rep) (p1 (Array Int natural)))
     (has_element__function_guard (has_element c1 p1) c1 p1))
     (=>
     (and (dynamic_invariant c true true true true)
     (= (has_element c p) true))
     (let ((result (element c p)))
     (=> (element__function_guard result c p) (dynamic_invariant2 result true
     false true true))))) :pattern ((element c p)) ))))

;; element__def_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p (Array Int natural)))
  (! (=> (dynamic_invariant c true true true true)
     (= (element c p) (to_rep
                      (let ((temp___265 (rec__composite_cursors__cont1__content
                                        (us_split_fields1 c))))
                      (select temp___265 (to_rep (select p 1))))))) :pattern (
  (element c p)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2
  (rec__composite_cursors__rec_cursor__content natural)))))
(define-fun us_split_fields_rec__composite_cursors__rec_cursor__content__projection ((a us_split_fields4)) natural 
  (rec__composite_cursors__rec_cursor__content a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq3 ((a us_rep2)
  (b us_rep2)) Bool (ite (= (to_rep
                            (rec__composite_cursors__rec_cursor__content
                            (us_split_fields5 a))) (to_rep
                                                   (rec__composite_cursors__rec_cursor__content
                                                   (us_split_fields5 b))))
                    true false))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const composite_cursors__rec_cursor__content__first__bit Int)

(declare-const composite_cursors__rec_cursor__content__last__bit Int)

(declare-const composite_cursors__rec_cursor__content__position Int)

;; composite_cursors__rec_cursor__content__first__bit_axiom
  (assert (<= 0 composite_cursors__rec_cursor__content__first__bit))

;; composite_cursors__rec_cursor__content__last__bit_axiom
  (assert
  (< composite_cursors__rec_cursor__content__first__bit composite_cursors__rec_cursor__content__last__bit))

;; composite_cursors__rec_cursor__content__position_axiom
  (assert (<= 0 composite_cursors__rec_cursor__content__position))

(declare-fun user_eq5 (us_rep2 us_rep2) Bool)

(declare-const dummy5 us_rep2)

(declare-datatypes ((rec_cursor__ref 0))
(((rec_cursor__refqtmk (rec_cursor__content us_rep2)))))
(define-fun rec_cursor__ref_rec_cursor__content__projection ((a rec_cursor__ref)) us_rep2 
  (rec_cursor__content a))

(declare-fun first1 (us_rep1) us_rep2)

(declare-fun first__function_guard1 (us_rep2 us_rep1) Bool)

;; first__post_axiom
  (assert true)

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

;; first__def_axiom
  (assert
  (forall ((c us_rep1))
  (! (=> (dynamic_invariant1 c true true true true)
     (= (first1 c) (us_repqtmk2 (us_split_fieldsqtmk2 rliteral)))) :pattern (
  (first1 c)) )))

(declare-fun has_element1 (us_rep1 us_rep2) Bool)

(declare-fun has_element__function_guard1 (Bool us_rep1 us_rep2) Bool)

;; has_element__post_axiom
  (assert true)

;; has_element__def_axiom
  (assert
  (forall ((c us_rep1))
  (forall ((p us_rep2))
  (! (= (= (has_element1 c p) true)
     (let ((temp___279 (to_rep
                       (rec__composite_cursors__rec_cursor__content
                       (us_split_fields5 p)))))
     (and (<= 1 temp___279)
     (<= temp___279 (to_rep
                    (rec__composite_cursors__cont2__length
                    (us_split_fields3 c))))))) :pattern ((has_element1 c p)) ))))

(declare-fun next1 (us_rep1 us_rep2) us_rep2)

(declare-fun next__function_guard1 (us_rep2 us_rep1 us_rep2) Bool)

;; next__post_axiom
  (assert
  (forall ((c us_rep1) (p us_rep2)) (has_element__function_guard1
  (has_element1 c p) c p)))

;; next__def_axiom
  (assert
  (forall ((c us_rep1))
  (forall ((p us_rep2))
  (! (=> (dynamic_invariant1 c true true true true)
     (= (next1 c p) (us_repqtmk2
                    (us_split_fieldsqtmk2
                    (of_rep
                    (+ (to_rep
                       (rec__composite_cursors__rec_cursor__content
                       (us_split_fields5 p))) 1)))))) :pattern ((next1 c p)) ))))

(declare-fun element1 (us_rep1 us_rep2) Int)

(declare-fun element__function_guard1 (Int us_rep1 us_rep2) Bool)

;; element__post_axiom
  (assert
  (forall ((c us_rep1))
  (forall ((p us_rep2))
  (! (and
     (forall ((c1 us_rep1) (p1 us_rep2)) (has_element__function_guard1
     (has_element1 c1 p1) c1 p1))
     (=>
     (and (dynamic_invariant1 c true true true true)
     (= (has_element1 c p) true))
     (let ((result (element1 c p)))
     (=> (element__function_guard1 result c p) (dynamic_invariant2 result
     true false true true))))) :pattern ((element1 c p)) ))))

;; element__def_axiom
  (assert
  (forall ((c us_rep1))
  (forall ((p us_rep2))
  (! (=> (dynamic_invariant1 c true true true true)
     (= (element1 c p) (to_rep
                       (let ((temp___289 (rec__composite_cursors__cont2__content
                                         (us_split_fields3 c))))
                       (select temp___289 (to_rep
                                          (rec__composite_cursors__rec_cursor__content
                                          (us_split_fields5 p)))))))) :pattern (
  (element1 c p)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun temp_____aggregate_def_294 (Int Int) (Array Int natural))

(declare-fun temp_____aggregate_def_300 (Int Int) (Array Int natural))

;; def_axiom
  (assert
  (forall ((temp___235 Int))
  (=> (dynamic_invariant2 temp___235 true true true true)
  (= (select (temp_____aggregate_def_233 temp___235) 1) rliteral))))

;; def_axiom
  (assert
  (forall ((temp___250 Int))
  (=> (dynamic_invariant2 temp___250 true true true true)
  (= (to_rep (select (temp_____aggregate_def_248 temp___250) 1)) temp___250))))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 0))

;; def_axiom
  (assert
  (forall ((temp___296 Int) (temp___297 Int))
  (let ((temp___295 (temp_____aggregate_def_294 temp___296 temp___297)))
  (=>
  (and (dynamic_invariant2 temp___296 true true true true)
  (dynamic_invariant2 temp___297 true true true true))
  (forall ((temp___298 Int))
  (ite (and (<= 1 temp___298) (<= temp___298 10))
  (= (select temp___295 temp___298) rliteral)
  (= (select temp___295 temp___298) rliteral1)))))))

;; def_axiom
  (assert
  (forall ((temp___302 Int) (temp___303 Int))
  (let ((temp___301 (temp_____aggregate_def_300 temp___302 temp___303)))
  (=>
  (and (dynamic_invariant2 temp___302 true true true true)
  (dynamic_invariant2 temp___303 true true true true))
  (forall ((temp___304 Int))
  (ite (and (<= 1 temp___304) (<= temp___304 10))
  (= (select temp___301 temp___304) rliteral)
  (= (select temp___301 temp___304) rliteral1)))))))

(declare-const rliteral2 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral2) 10))

(assert
;; defqtvc
 ;; File "loop_iterable.adb", line 2, characters 0-0
  (not
  (forall ((e Int))
  (=> (dynamic_predicate
  (us_repqtmk
  (us_split_fieldsqtmk (temp_____aggregate_def_294 1 0) rliteral2)))
  (forall ((c1__split_fields us_split_fields))
  (=>
  (= c1__split_fields (us_split_fieldsqtmk (temp_____aggregate_def_294 1 0)
                      rliteral2))
  (=> (dynamic_invariant (us_repqtmk c1__split_fields) true false true true)
  (=> (dynamic_predicate1
  (us_repqtmk1
  (us_split_fieldsqtmk1 (temp_____aggregate_def_300 1 0) rliteral2)))
  (forall ((c2__split_fields us_split_fields2))
  (=>
  (= c2__split_fields (us_split_fieldsqtmk1 (temp_____aggregate_def_300 1 0)
                      rliteral2))
  (=> (dynamic_invariant1 (us_repqtmk1 c2__split_fields) true false true
  true)
  (let ((o (us_repqtmk c1__split_fields)))
  (let ((o1 (first o)))
  (=>
  (and (first__function_guard o1 o) (= o1 (temp_____aggregate_def_233 1)))
  (forall ((e1 Int))
  (=>
  (let ((o2 (us_repqtmk c1__split_fields)))
  (let ((o3 (has_element o2 o1)))
  (and
  (and (has_element__function_guard o3 o2 o1)
  (= (= o3 true)
  (let ((temp___240 (to_rep (select o1 1))))
  (and (<= 1 temp___240)
  (<= temp___240 (to_rep
                 (rec__composite_cursors__cont1__length c1__split_fields)))))))
  (ite (= o3 true)
  (let ((o4 (us_repqtmk c1__split_fields)))
  (let ((o5 (element o4 o1)))
  (and
  (and (element__function_guard o5 o4 o1)
  (and (dynamic_invariant2 o5 true false true true)
  (= o5 (to_rep
        (select (rec__composite_cursors__cont1__content c1__split_fields) 
        (to_rep (select o1 1)))))))
  (= e1 o5)))) (= e1 e)))))
  (let ((o2 (us_repqtmk c1__split_fields)))
  (let ((o3 (has_element o2 o1)))
  (=>
  (and (has_element__function_guard o3 o2 o1)
  (= (= o3 true)
  (let ((temp___240 (to_rep (select o1 1))))
  (and (<= 1 temp___240)
  (<= temp___240 (to_rep
                 (rec__composite_cursors__cont1__length c1__split_fields)))))))
  (=> (= o3 true)
  (forall ((e2 Int) (temp___308 (Array Int natural)))
  (=>
  (forall ((c1__split_fields1 us_split_fields)
  (temp___3081 (Array Int natural))) (has_element__function_guard
  (has_element (us_repqtmk c1__split_fields1) temp___3081)
  (us_repqtmk c1__split_fields1) temp___3081))
  (=>
  (forall ((c1__split_fields1 us_split_fields)
  (temp___3081 (Array Int natural))) (element__function_guard
  (element (us_repqtmk c1__split_fields1) temp___3081)
  (us_repqtmk c1__split_fields1) temp___3081))
  (=>
  (and (= (has_element (us_repqtmk c1__split_fields) temp___308) true)
  (= e2 (element (us_repqtmk c1__split_fields) temp___308))) (= e2 1)))))))))))))))))))))))))
(check-sat)
(exit)
