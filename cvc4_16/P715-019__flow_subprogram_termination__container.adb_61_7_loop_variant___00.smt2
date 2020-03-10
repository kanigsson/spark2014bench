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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int positive))))))
(declare-fun slide ((Array Int positive) Int Int) (Array Int positive))

;; slide_eq
  (assert
  (forall ((a (Array Int positive)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int positive)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int positive)) (a__first Int) (a__last Int)
  (b (Array Int positive)) (b__first Int)
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
  (forall ((a (Array Int positive)) (b (Array Int positive)))
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

(declare-const dummy3 (Array Int positive))

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

(declare-fun user_eq3 ((Array Int positive) (Array Int positive)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__container__container__a (Array Int positive))))))
(define-fun us_split_fields_rec__container__container__a__projection ((a us_split_fields)) (Array Int positive) 
  (rec__container__container__a a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (= (bool_eq
                           (rec__container__container__a
                           (us_split_fields1 a)) 1 200
                           (rec__container__container__a
                           (us_split_fields1 b)) 1 200) true)
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

(declare-const container__container__a__first__bit Int)

(declare-const container__container__a__last__bit Int)

(declare-const container__container__a__position Int)

;; container__container__a__first__bit_axiom
  (assert (<= 0 container__container__a__first__bit))

;; container__container__a__last__bit_axiom
  (assert
  (< container__container__a__first__bit container__container__a__last__bit))

;; container__container__a__position_axiom
  (assert (<= 0 container__container__a__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((container__ref 0))
(((container__refqtmk (container__content us_rep)))))
(define-fun container__ref_container__content__projection ((a container__ref)) us_rep 
  (container__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__container__cursor__index natural)))))
(define-fun us_split_fields_rec__container__cursor__index__projection ((a us_split_fields2)) natural 
  (rec__container__cursor__index a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (to_rep1
                            (rec__container__cursor__index
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__container__cursor__index
                                                   (us_split_fields3 b))))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const container__cursor__index__first__bit Int)

(declare-const container__cursor__index__last__bit Int)

(declare-const container__cursor__index__position Int)

;; container__cursor__index__first__bit_axiom
  (assert (<= 0 container__cursor__index__first__bit))

;; container__cursor__index__last__bit_axiom
  (assert
  (< container__cursor__index__first__bit container__cursor__index__last__bit))

;; container__cursor__index__position_axiom
  (assert (<= 0 container__cursor__index__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep1)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep1 
  (cursor__content a))

(declare-fun first (us_rep) us_rep1)

(declare-fun first__function_guard (us_rep1 us_rep) Bool)

;; first__post_axiom
  (assert true)

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

;; first__def_axiom
  (assert
  (forall ((c us_rep))
  (! (= (first c) (us_repqtmk1 (us_split_fieldsqtmk1 rliteral))) :pattern (
  (first c)) )))

(declare-fun has_element (us_rep us_rep1) Bool)

(declare-fun has_element__function_guard (Bool us_rep us_rep1) Bool)

;; has_element__post_axiom
  (assert true)

;; has_element__def_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p us_rep1))
  (! (= (= (has_element c p) true)
     (let ((temp___209 (to_rep1
                       (rec__container__cursor__index (us_split_fields3 p)))))
     (and (<= 1 temp___209) (<= temp___209 200)))) :pattern ((has_element c
                                                             p)) ))))

(declare-fun next (us_rep us_rep1) us_rep1)

(declare-fun next__function_guard (us_rep1 us_rep us_rep1) Bool)

;; next__post_axiom
  (assert
  (forall ((c us_rep) (p us_rep1)) (has_element__function_guard
  (has_element c p) c p)))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 0))

;; next__def_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p us_rep1))
  (! (= (next c p) (ite (< (to_rep1
                           (rec__container__cursor__index
                           (us_split_fields3 p))) 200)
                   (us_repqtmk1
                   (us_split_fieldsqtmk1
                   (of_rep1
                   (+ (to_rep1
                      (rec__container__cursor__index (us_split_fields3 p))) 1))))
                   (us_repqtmk1 (us_split_fieldsqtmk1 rliteral1)))) :pattern (
  (next c p)) ))))

(declare-fun element (us_rep us_rep1) Int)

(declare-fun element__function_guard (Int us_rep us_rep1) Bool)

;; element__post_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p us_rep1))
  (! (and
     (forall ((c1 us_rep) (p1 us_rep1)) (has_element__function_guard
     (has_element c1 p1) c1 p1))
     (=> (= (has_element c p) true)
     (let ((result (element c p)))
     (=> (element__function_guard result c p) (dynamic_invariant result true
     false true true))))) :pattern ((element c p)) ))))

;; element__def_axiom
  (assert
  (forall ((c us_rep))
  (forall ((p us_rep1))
  (! (= (element c p) (to_rep
                      (let ((temp___219 (rec__container__container__a
                                        (us_split_fields1 c))))
                      (select temp___219 (to_rep1
                                         (rec__container__cursor__index
                                         (us_split_fields3 p))))))) :pattern (
  (element c p)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-sort my_integer 0)

(declare-fun my_integerqtint (my_integer) Int)

;; my_integer'axiom
  (assert
  (forall ((i my_integer))
  (and (<= 1 (my_integerqtint i)) (<= (my_integerqtint i) 200))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 200)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (my_integer my_integer) Bool)

(declare-const dummy6 my_integer)

(declare-datatypes ((my_integer__ref 0))
(((my_integer__refqtmk (my_integer__content my_integer)))))
(define-fun my_integer__ref_my_integer__content__projection ((a my_integer__ref)) my_integer 
  (my_integer__content a))

(define-fun dynamic_invariant1 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 1 200)) (in_range4 temp___expr_165)))

(declare-sort small_int 0)

(declare-fun small_intqtint (small_int) Int)

;; small_int'axiom
  (assert
  (forall ((i small_int))
  (and (<= 1 (small_intqtint i)) (<= (small_intqtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (small_int small_int) Bool)

(declare-const dummy7 small_int)

(declare-datatypes ((small_int__ref 0))
(((small_int__refqtmk (small_int__content small_int)))))
(define-fun small_int__ref_small_int__content__projection ((a small_int__ref)) small_int 
  (small_int__content a))

(define-fun dynamic_invariant2 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 1 10)) (in_range5 temp___expr_172)))

(declare-fun container__arr__aggregate_def (Int) (Array Int positive))

(define-fun dynamic_invariant3 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-const rliteral2 positive)

;; rliteral_axiom
  (assert (= (positiveqtint rliteral2) 3))

;; def_axiom
  (assert
  (forall ((temp___270 Int))
  (=> (dynamic_invariant4 temp___270 true true true true)
  (forall ((temp___271 Int))
  (= (select (container__arr__aggregate_def temp___270) temp___271) rliteral2)))))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (count count) Bool)

(declare-const dummy8 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant5 ((temp___expr_224 Int)
  (temp___is_init_220 Bool) (temp___skip_constant_221 Bool)
  (temp___do_toplevel_222 Bool)
  (temp___do_typ_inv_223 Bool)) Bool (=>
                                     (or (= temp___is_init_220 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_224)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

(assert
;; defqtvc
 ;; File "container.ads", line 1, characters 0-0
  (not
  (forall ((b Bool) (standard_in us_private) (file_system us_private)
  (standard_out us_private) (standard_err us_private) (current_in us_private)
  (current_out us_private) (current_err us_private) (x Int) (r Int) (i Int)
  (arr (Array Int positive))
  (my_container__split_fields (Array Int positive))
  (position__split_fields natural) (x1 Int) (b1 Bool))
  (=> (= x 1)
  (=> (dynamic_invariant1 x true false true true)
  (=> (= r 100)
  (=> (dynamic_invariant1 r true false true true)
  (=> (= i 1)
  (=> (dynamic_invariant2 i true false true true)
  (=>
  (= (line_length standard_in file_system standard_out standard_err
     current_in current_out current_err) 0)
  (=>
  (= (page_length standard_in file_system standard_out standard_err
     current_in current_out current_err) 0)
  (=> (= arr (container__arr__aggregate_def 3))
  (=> (= my_container__split_fields arr)
  (=> (= position__split_fields rliteral1)
  (=>
  (ite (< 0 x)
  (exists ((x2 Int))
  (and
  (= (and (ite (dynamic_invariant1 x2 true true true true) true false) 
  (ite (< 0 x2) true false)) true)
  (and (= b1 (distinct 1 0))
  (and
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (< x2 200) true false))
  (ite (= spark__branch true)
  (let ((o (+ x2 1))) (and (in_range4 o) (= x1 o))) (= x1 x2))))
  (not (< 0 x1)))))) (and (= x1 x) (= b1 b)))
  (=> (< i 10)
  (let ((o (* 10 i)))
  (=> (in_range1 o)
  (=> (in_range1 (- 100 o))
  (forall ((r1 Int) (i1 Int))
  (=> (<= (- 100 (* 10 i1)) r1)
  (=>
  (= (and (ite (and (dynamic_invariant1 r1 true true true true)
               (dynamic_invariant2 i1 true true true true))
          true false) (ite (< i1 10) true false)) true)
  (forall ((temp___233 Int))
  (=> (= temp___233 i1)
  (forall ((temp___232 Int))
  (=> (= temp___232 r1)
  (let ((o1 (- r1 i1)))
  (=> (in_range4 o1)
  (forall ((r2 Int))
  (=> (= r2 o1)
  (let ((o2 (+ i1 1)))
  (=> (in_range5 o2)
  (forall ((i2 Int))
  (=> (= i2 o2)
  (=> (< i2 10)
  (or (< temp___233 i2) (and (= i2 temp___233) (< r2 temp___232))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
