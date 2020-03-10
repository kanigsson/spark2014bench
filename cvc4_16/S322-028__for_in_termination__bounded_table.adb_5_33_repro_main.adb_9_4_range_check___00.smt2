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

(declare-sort opt_index_type 0)

(declare-fun opt_index_typeqtint (opt_index_type) Int)

;; opt_index_type'axiom
  (assert
  (forall ((i opt_index_type))
  (and (<= 0 (opt_index_typeqtint i)) (<= (opt_index_typeqtint i) 32))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 32)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (opt_index_type opt_index_type) Bool)

(declare-const dummy opt_index_type)

(declare-datatypes ((opt_index_type__ref 0))
(((opt_index_type__refqtmk (opt_index_type__content opt_index_type)))))
(define-fun opt_index_type__ref_opt_index_type__content__projection ((a opt_index_type__ref)) opt_index_type 
  (opt_index_type__content a))

(define-fun to_rep ((x opt_index_type)) Int (opt_index_typeqtint x))

(declare-fun of_rep (Int) opt_index_type)

;; inversion_axiom
  (assert
  (forall ((x opt_index_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x opt_index_type)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort elem_type 0)

(declare-fun elem_typeqtint (elem_type) Int)

;; elem_type'axiom
  (assert
  (forall ((i elem_type))
  (and (<= (- 2147483648) (elem_typeqtint i))
  (<= (elem_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (elem_type elem_type) Bool)

(declare-const dummy1 elem_type)

(declare-datatypes ((elem_type__ref 0))
(((elem_type__refqtmk (elem_type__content elem_type)))))
(define-fun elem_type__ref_elem_type__content__projection ((a elem_type__ref)) elem_type 
  (elem_type__content a))

(define-fun to_rep1 ((x elem_type)) Int (elem_typeqtint x))

(declare-fun of_rep1 (Int) elem_type)

;; inversion_axiom
  (assert
  (forall ((x elem_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x elem_type)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int elem_type))))))
(declare-fun slide ((Array Int elem_type) Int Int) (Array Int elem_type))

;; slide_eq
  (assert
  (forall ((a (Array Int elem_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int elem_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int elem_type)) (a__first Int) (a__last Int)
  (b (Array Int elem_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep1 (select a temp___idx_156)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int elem_type)) (b (Array Int elem_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep1 (select a temp___idx_156)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-const dummy2 (Array Int elem_type))

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

(declare-fun user_eq2 ((Array Int elem_type) (Array Int elem_type)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__repro_main__int_table__t__elems (Array Int elem_type))(rec__repro_main__int_table__t__last opt_index_type)))))
(define-fun us_split_fields_rec__repro_main__int_table__t__elems__projection ((a us_split_fields)) (Array Int elem_type) 
  (rec__repro_main__int_table__t__elems a))

(define-fun us_split_fields_rec__repro_main__int_table__t__last__projection ((a us_split_fields)) opt_index_type 
  (rec__repro_main__int_table__t__last a))

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
                           (rec__repro_main__int_table__t__elems
                           (us_split_fields1 a)) 1 32
                           (rec__repro_main__int_table__t__elems
                           (us_split_fields1 b)) 1 32) true)
                        (= (to_rep
                           (rec__repro_main__int_table__t__last
                           (us_split_fields1 a))) (to_rep
                                                  (rec__repro_main__int_table__t__last
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

(declare-const repro_main__int_table__t__elems__first__bit Int)

(declare-const repro_main__int_table__t__elems__last__bit Int)

(declare-const repro_main__int_table__t__elems__position Int)

;; repro_main__int_table__t__elems__first__bit_axiom
  (assert (<= 0 repro_main__int_table__t__elems__first__bit))

;; repro_main__int_table__t__elems__last__bit_axiom
  (assert
  (< repro_main__int_table__t__elems__first__bit repro_main__int_table__t__elems__last__bit))

;; repro_main__int_table__t__elems__position_axiom
  (assert (<= 0 repro_main__int_table__t__elems__position))

(declare-const repro_main__int_table__t__last__first__bit Int)

(declare-const repro_main__int_table__t__last__last__bit Int)

(declare-const repro_main__int_table__t__last__position Int)

;; repro_main__int_table__t__last__first__bit_axiom
  (assert (<= 0 repro_main__int_table__t__last__first__bit))

;; repro_main__int_table__t__last__last__bit_axiom
  (assert
  (< repro_main__int_table__t__last__first__bit repro_main__int_table__t__last__last__bit))

;; repro_main__int_table__t__last__position_axiom
  (assert (<= 0 repro_main__int_table__t__last__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-fun has_element (us_rep Int) Bool)

(declare-fun has_element__function_guard (Bool us_rep Int) Bool)

(declare-sort cursor_type 0)

(declare-fun cursor_typeqtint (cursor_type) Int)

;; cursor_type'axiom
  (assert
  (forall ((i cursor_type))
  (and (<= 1 (cursor_typeqtint i)) (<= (cursor_typeqtint i) 33))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 33)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (cursor_type cursor_type) Bool)

(declare-const dummy4 cursor_type)

(declare-datatypes ((cursor_type__ref 0))
(((cursor_type__refqtmk (cursor_type__content cursor_type)))))
(define-fun cursor_type__ref_cursor_type__content__projection ((a cursor_type__ref)) cursor_type 
  (cursor_type__content a))

(define-fun dynamic_invariant ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 1 33)) (in_range2 temp___expr_206)))

;; has_element__post_axiom
  (assert true)

;; has_element__def_axiom
  (assert
  (forall ((table us_rep))
  (forall ((cursor Int))
  (! (= (= (has_element table cursor) true)
     (and (< cursor 33)
     (<= cursor (to_rep
                (rec__repro_main__int_table__t__last
                (us_split_fields1 table)))))) :pattern ((has_element table
                                                        cursor)) ))))

(declare-const table us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const cursor Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 32))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 32)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (index_type index_type) Bool)

(declare-const dummy5 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_213 Int)
  (temp___is_init_209 Bool) (temp___skip_constant_210 Bool)
  (temp___do_toplevel_211 Bool)
  (temp___do_typ_inv_212 Bool)) Bool (=>
                                     (or (= temp___is_init_209 true)
                                     (<= 0 32)) (in_range temp___expr_213)))

(define-fun dynamic_invariant2 ((temp___expr_220 Int)
  (temp___is_init_216 Bool) (temp___skip_constant_217 Bool)
  (temp___do_toplevel_218 Bool)
  (temp___do_typ_inv_219 Bool)) Bool (=>
                                     (or (= temp___is_init_216 true)
                                     (<= 1 32)) (in_range3 temp___expr_220)))

(define-fun dynamic_invariant3 ((temp___expr_199 Int)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (=>
                                     (or (= temp___is_init_195 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_199)))

(assert
;; defqtvc
 ;; File "bounded_table.ads", line 42, characters 0-0
  (not
  (=> (dynamic_invariant cursor true false true true)
  (=> (has_element__function_guard (has_element table cursor) table cursor)
  (=> (= (has_element table cursor) true) (in_range3 cursor))))))
(check-sat)
(exit)
