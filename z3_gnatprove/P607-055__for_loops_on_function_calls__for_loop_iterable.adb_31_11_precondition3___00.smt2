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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
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

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int natural))))))
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

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__declare_iterable__container__content (Array Int natural))))))
(define-fun us_split_fields_rec__declare_iterable__container__content__projection ((a us_split_fields)) (Array Int natural) 
  (rec__declare_iterable__container__content a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (= (bool_eq
                           (rec__declare_iterable__container__content
                           (us_split_fields1 a)) 1 100
                           (rec__declare_iterable__container__content
                           (us_split_fields1 b)) 1 100) true)
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

(declare-const declare_iterable__container__content__first__bit Int)

(declare-const declare_iterable__container__content__last__bit Int)

(declare-const declare_iterable__container__content__position Int)

;; declare_iterable__container__content__first__bit_axiom
  (assert (<= 0 declare_iterable__container__content__first__bit))

;; declare_iterable__container__content__last__bit_axiom
  (assert
  (< declare_iterable__container__content__first__bit declare_iterable__container__content__last__bit))

;; declare_iterable__container__content__position_axiom
  (assert (<= 0 declare_iterable__container__content__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((container__ref (container__refqtmk (container__content us_rep)))))
(define-fun container__ref_container__content__projection ((a container__ref)) us_rep 
  (container__content a))

(declare-fun has_element (us_rep Int) Bool)

(declare-fun has_element__function_guard (Bool us_rep Int) Bool)

(declare-sort cursor 0)

(declare-fun cursorqtint (cursor) Int)

;; cursor'axiom
  (assert
  (forall ((i cursor)) (and (<= 0 (cursorqtint i)) (<= (cursorqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (cursor cursor) Bool)

(declare-const dummy3 cursor)

(declare-datatypes ()
((cursor__ref (cursor__refqtmk (cursor__content cursor)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) cursor 
  (cursor__content a))

(define-fun dynamic_invariant ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 0 100)) (in_range2 temp___expr_191)))

(declare-sort valid_cursor 0)

(declare-fun valid_cursorqtint (valid_cursor) Int)

;; valid_cursor'axiom
  (assert
  (forall ((i valid_cursor))
  (and (<= 1 (valid_cursorqtint i)) (<= (valid_cursorqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (valid_cursor valid_cursor) Bool)

(declare-const dummy4 valid_cursor)

(declare-datatypes ()
((valid_cursor__ref
 (valid_cursor__refqtmk (valid_cursor__content valid_cursor)))))
(define-fun valid_cursor__ref_valid_cursor__content__projection ((a valid_cursor__ref)) valid_cursor 
  (valid_cursor__content a))

;; has_element__post_axiom
  (assert true)

;; has_element__def_axiom
  (assert
  (forall ((x us_rep))
  (forall ((c Int))
  (! (= (= (has_element x c) true) (in_range3 c)) :pattern ((has_element x c)) ))))

(declare-fun next (us_rep Int) Int)

(declare-fun next__function_guard (Int us_rep Int) Bool)

;; next__post_axiom
  (assert
  (forall ((x us_rep))
  (forall ((c Int))
  (! (and
     (forall ((x1 us_rep) (c1 Int)) (has_element__function_guard
     (has_element x1 c1) x1 c1))
     (=>
     (and (dynamic_invariant c true true true true)
     (= (has_element x c) true))
     (let ((result (next x c)))
     (=> (next__function_guard result x c) (dynamic_invariant result true
     false true true))))) :pattern ((next x c)) ))))

;; next__def_axiom
  (assert
  (forall ((x us_rep))
  (forall ((c Int))
  (! (=> (dynamic_invariant c true true true true)
     (= (next x c) (ite (= c 100) 0 (+ c 1)))) :pattern ((next x c)) ))))

(declare-fun first (us_rep) Int)

(declare-fun first__function_guard (Int us_rep) Bool)

;; first__post_axiom
  (assert
  (forall ((x us_rep))
  (! (let ((result (first x)))
     (=> (first__function_guard result x) (dynamic_invariant result true
     false true true))) :pattern ((first x)) )))

;; first__def_axiom
  (assert (forall ((x us_rep)) (! (= (first x) 1) :pattern ((first x)) )))

(declare-fun element (us_rep Int) Int)

(declare-fun element__function_guard (Int us_rep Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; element__post_axiom
  (assert
  (forall ((x us_rep))
  (forall ((c Int))
  (! (and
     (forall ((x1 us_rep) (c1 Int)) (has_element__function_guard
     (has_element x1 c1) x1 c1))
     (=>
     (and (dynamic_invariant c true true true true)
     (= (has_element x c) true))
     (let ((result (element x c)))
     (=> (element__function_guard result x c) (dynamic_invariant1 result true
     false true true))))) :pattern ((element x c)) ))))

;; element__def_axiom
  (assert
  (forall ((x us_rep))
  (forall ((c Int))
  (! (=> (dynamic_invariant c true true true true)
     (= (element x c) (to_rep
                      (let ((temp___247 (rec__declare_iterable__container__content
                                        (us_split_fields1 x))))
                      (select temp___247 c))))) :pattern ((element x c)) ))))

(declare-fun from_nat_array ((Array Int natural)) us_rep)

(declare-fun from_nat_array__function_guard (us_rep
  (Array Int natural)) Bool)

;; from_nat_array__post_axiom
  (assert true)

;; from_nat_array__def_axiom
  (assert
  (forall ((a (Array Int natural)))
  (! (= (from_nat_array a) (us_repqtmk (us_split_fieldsqtmk a))) :pattern (
  (from_nat_array a)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun for_loop_iterable__p3__a__aggregate_def (Int) (Array Int natural))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___275 Int))
  (=> (dynamic_invariant1 temp___275 true true true true)
  (forall ((temp___276 Int))
  (= (select (for_loop_iterable__p3__a__aggregate_def temp___275) temp___276) 
  rliteral)))))

(define-fun dynamic_invariant2 ((temp___expr_198 Int)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (=>
                                     (or (= temp___is_init_194 true)
                                     (<= 1 100)) (in_range3 temp___expr_198)))

(declare-const e Int)

(declare-const a (Array Int natural))

;; H
  (assert (= a (for_loop_iterable__p3__a__aggregate_def 0)))

;; Assume
  (assert true)

(define-fun for_loop_iterable__p3__g__assume () us_rep (from_nat_array a))

;; H
  (assert (from_nat_array__function_guard for_loop_iterable__p3__g__assume
  a))

;; H
  (assert true)

;; H
  (assert
  (= for_loop_iterable__p3__g__assume (us_repqtmk (us_split_fieldsqtmk a))))

(declare-const g__split_fields (Array Int natural))

;; H
  (assert
  (= (us_split_fieldsqtmk g__split_fields) (us_split_fields1
                                           for_loop_iterable__p3__g__assume)))

;; Assume
  (assert true)

(define-fun o () us_rep (us_repqtmk (us_split_fieldsqtmk g__split_fields)))

(define-fun o1 () Int (first o))

;; H
  (assert (first__function_guard o1 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert (= o1 1))

(declare-const e1 Int)

;; H
  (assert
  (let ((o2 (us_repqtmk (us_split_fieldsqtmk g__split_fields))))
  (has_element__function_guard (has_element o2 o1) o2 o1)))

;; H
  (assert
  (=
  (= (has_element (us_repqtmk (us_split_fieldsqtmk g__split_fields)) o1) true)
  (in_range3 o1)))

;; H
  (assert
  (ite (= (has_element (us_repqtmk (us_split_fieldsqtmk g__split_fields)) o1) true)
  (let ((o2 (us_repqtmk (us_split_fieldsqtmk g__split_fields))))
  (let ((o3 (element o2 o1)))
  (and
  (and (element__function_guard o3 o2 o1)
  (and (dynamic_invariant1 o3 true false true true)
  (= o3 (to_rep (select g__split_fields o1))))) (= e1 o3)))) (= e1 e)))

(define-fun o2 () us_rep (us_repqtmk (us_split_fieldsqtmk g__split_fields)))

(define-fun o3 () Bool (has_element o2 o1))

;; H
  (assert (has_element__function_guard o3 o2 o1))

;; H
  (assert (= (= o3 true) (in_range3 o1)))

;; H
  (assert (= o3 true))

(declare-const g__split_fields1 (Array Int natural))

(declare-const e2 Int)

(declare-const temp___280 Int)

;; H
  (assert
  (forall ((g__split_fields2 (Array Int natural)) (temp___2801 Int))
  (has_element__function_guard
  (has_element (us_repqtmk (us_split_fieldsqtmk g__split_fields2))
  temp___2801) (us_repqtmk (us_split_fieldsqtmk g__split_fields2))
  temp___2801)))

;; H
  (assert
  (forall ((g__split_fields2 (Array Int natural)) (temp___2801 Int))
  (element__function_guard
  (element (us_repqtmk (us_split_fieldsqtmk g__split_fields2)) temp___2801)
  (us_repqtmk (us_split_fieldsqtmk g__split_fields2)) temp___2801)))

;; H
  (assert
  (= (and (ite true true false) (ite (and
                                     (= (has_element
                                        (us_repqtmk
                                        (us_split_fieldsqtmk
                                        g__split_fields1)) temp___280) true)
                                     (= e2 (element
                                           (us_repqtmk
                                           (us_split_fieldsqtmk
                                           g__split_fields1)) temp___280)))
                                true false)) true))

(declare-const g__split_fields2 (Array Int natural))

;; Ensures
  (assert true)

;; Assert
  (assert (= e2 0))

(define-fun o4 () us_rep (us_repqtmk (us_split_fieldsqtmk g__split_fields2)))

(define-fun o5 () Int (next o4 temp___280))

;; H
  (assert (next__function_guard o5 o4 temp___280))

;; H
  (assert (dynamic_invariant o5 true false true true))

;; H
  (assert (= o5 (ite (= temp___280 100) 0 (+ temp___280 1))))

(define-fun o6 () us_rep (us_repqtmk (us_split_fieldsqtmk g__split_fields2)))

(define-fun o7 () Bool (has_element o6 o5))

;; H
  (assert (has_element__function_guard o7 o6 o5))

;; H
  (assert (= (= o7 true) (in_range3 o5)))

;; H
  (assert (= o7 true))

(define-fun o8 () us_rep (us_repqtmk (us_split_fieldsqtmk g__split_fields2)))

;; H
  (assert
  (forall ((temp___2801 Int) (o9 us_rep)) (has_element__function_guard
  (has_element o9 temp___2801) o9 temp___2801)))

(assert
;; defqtvc
 ;; File "for_loop_iterable.adb", line 27, characters 0-0
  (not (= (has_element o8 temp___280) true)))
(check-sat)

(exit)
