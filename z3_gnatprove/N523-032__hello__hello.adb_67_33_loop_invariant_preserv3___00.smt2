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

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (character character) Bool)

(declare-const dummy1 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant ((temp___expr_96 us_t) (temp___is_init_92 Bool)
  (temp___skip_constant_93 Bool) (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant1 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(declare-fun to_upper (Int) Int)

(declare-fun to_upper__function_guard (Int Int) Bool)

;; to_upper__post_axiom
  (assert
  (forall ((item Int))
  (! (=> (dynamic_invariant1 item true true true true) (dynamic_invariant1
     (to_upper item) true false true true)) :pattern ((to_upper item)) )))

(declare-fun to_lower (Int) Int)

(declare-fun to_lower__function_guard (Int Int) Bool)

;; to_lower__post_axiom
  (assert
  (forall ((item Int))
  (! (=> (dynamic_invariant1 item true true true true) (dynamic_invariant1
     (to_lower item) true false true true)) :pattern ((to_lower item)) )))

(declare-fun to_caml_char2 (us_t us_t Int) Bool)

(declare-fun to_caml_char2__function_guard (Bool us_t us_t Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

;; to_caml_char2__post_axiom
  (assert true)

;; to_caml_char2__def_axiom
  (assert
  (forall ((str us_t) (res us_t))
  (forall ((last2 Int))
  (! (= (= (to_caml_char2 str res last2) true)
     (forall ((j Int))
     (=> (and (<= (first1 str) j) (<= j last2))
     (ite (= j (first1 str))
     (= (to_rep (select (to_array res) j)) (to_upper
                                           (to_rep (select (to_array str) j))))
     (ite (and
          (= (not (let ((temp___186 (to_rep (select (to_array str) (- j 1)))))
                  (and (ite (<= 97 temp___186) true false) (ite (<= temp___186 122)
                                                           true false)))) true)
          (= (not (let ((temp___187 (to_rep (select (to_array str) (- j 1)))))
                  (and (ite (<= 65 temp___187) true false) (ite (<= temp___187 90)
                                                           true false)))) true))
     (= (to_rep (select (to_array res) j)) (to_upper
                                           (to_rep (select (to_array str) j))))
     (= (to_rep (select (to_array res) j)) (to_lower
                                           (to_rep (select (to_array str) j))))))))) :pattern (
  (to_caml_char2 str res last2)) ))))

(declare-const str us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const ret__first integer)

(declare-const ret__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes () ((tretS__ref (tretS__refqtmk (tretS__content us_t)))))
(define-fun tretS__ref_tretS__content__projection ((a tretS__ref)) us_t 
  (tretS__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes () ((t7b__ref (t7b__refqtmk (t7b__content integer)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) integer 
  (t7b__content a))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_204 us_t)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (not (= temp___skip_constant_201 true))
                                     (and (dynamic_property (first1 str)
                                     (last1 str) (first1 temp___expr_204)
                                     (last1 temp___expr_204))
                                     (and
                                     (= (first1 temp___expr_204) (first1 str))
                                     (= (last1 temp___expr_204) (last1 str))))))

(define-fun default_initial_assumption ((temp___expr_206 us_t)
  (temp___skip_top_level_207 Bool)) Bool (and
                                         (= (first1 temp___expr_206) 
                                         (first1 str))
                                         (= (last1 temp___expr_206) (last1
                                                                    str))))

;; Assume
  (assert (dynamic_invariant str true false true true))

;; Assert
  (assert
  (ite (<= (first1 str) (last1 str)) (<= (first1 str) (last1 str))
  (< (last1 str) (first1 str))))

(define-fun hello__to_camel_case__ret__assume () us_t (of_array
                                                      (slide (to_array str)
                                                      (first1 str)
                                                      (first1 str))
                                                      (first1 str)
                                                      (last1 str)))

(declare-const ret (Array Int character))

;; H
  (assert (= ret (to_array hello__to_camel_case__ret__assume)))

;; Assume
  (assert
  (= (to_rep1 ret__first) (first1 hello__to_camel_case__ret__assume)))

;; Assume
  (assert (= (to_rep1 ret__last) (last1 hello__to_camel_case__ret__assume)))

;; Assume
  (assert
  (and (dynamic_property (first1 str) (last1 str) (to_rep1 ret__first)
  (to_rep1 ret__last))
  (and (= (to_rep1 ret__first) (first1 str))
  (= (to_rep1 ret__last) (last1 str)))))

(declare-const to_up Bool)

;; H
  (assert (= to_up (distinct 1 0)))

(define-fun temp___238 () Int (first1 str))

(define-fun temp___239 () Int (last1 str))

(declare-const idx Int)

;; H
  (assert (= idx temp___238))

;; H
  (assert
  (= (and (ite (<= temp___238 idx) true false) (ite (<= idx temp___239) true
                                               false)) true))

(declare-const spark__branch Bool)

(declare-const ret1 (Array Int character))

;; H
  (assert (= spark__branch to_up))

(declare-const o Int)

(declare-const o1 character)

(declare-const o2 Int)

(declare-const o3 character)

;; H
  (assert
  (ite (= spark__branch true)
  (and (= (to_rep (select ret idx)) o2)
  (let ((o4 (to_upper o2)))
  (and (dynamic_invariant1 o4 true false true true)
  (and (= (to_rep o3) o4) (= ret1 (store ret idx o3))))))
  (and (= (to_rep (select ret idx)) o)
  (let ((o4 (to_lower o)))
  (and (dynamic_invariant1 o4 true false true true)
  (and (= (to_rep o1) o4) (= ret1 (store ret idx o1))))))))

;; Assert
  (assert true)

;; Assert
  (assert (and (<= (first1 str) idx) (<= idx (last1 str))))

;; Assert
  (assert (and (<= (to_rep1 ret__first) idx) (<= idx (to_rep1 ret__last))))

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep1 ret__last) o4))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep1 ret__first) o5))

(define-fun o6 () us_t (of_array ret1 o5 o4))

(define-fun o7 () us_t str)

(define-fun temp___inv_248 () Bool (to_caml_char2 o7 o6 idx))

;; H
  (assert (to_caml_char2__function_guard temp___inv_248 o7 o6 idx))

;; H
  (assert
  (= (= temp___inv_248 true)
  (forall ((j Int))
  (=> (and (<= (first1 o7) j) (<= j idx))
  (ite (= j (first1 o7))
  (= (to_rep (select (to_array o6) j)) (to_upper
                                       (to_rep (select (to_array o7) j))))
  (ite (and
       (= (not (let ((temp___184 (to_rep (select (to_array o7) (- j 1)))))
               (and (ite (<= 97 temp___184) true false) (ite (<= temp___184 122)
                                                        true false)))) true)
       (= (not (let ((temp___185 (to_rep (select (to_array o7) (- j 1)))))
               (and (ite (<= 65 temp___185) true false) (ite (<= temp___185 90)
                                                        true false)))) true))
  (= (to_rep (select (to_array o6) j)) (to_upper
                                       (to_rep (select (to_array o7) j))))
  (= (to_rep (select (to_array o6) j)) (to_lower
                                       (to_rep (select (to_array o7) j))))))))))

(declare-const ret2 (Array Int character))

(declare-const idx1 Int)

;; H
  (assert
  (forall ((ret3 (Array Int character)) (idx2 Int))
  (to_caml_char2__function_guard
  (to_caml_char2 str (of_array ret3 (to_rep1 ret__first) (to_rep1 ret__last))
  idx2) str (of_array ret3 (to_rep1 ret__first) (to_rep1 ret__last)) idx2)))

;; LoopInvariant
  (assert
  (= (to_caml_char2 str
     (of_array ret2 (to_rep1 ret__first) (to_rep1 ret__last)) idx1) true))

;; LoopInvariant
  (assert
  (forall ((j Int))
  (=> (and (<= idx1 j) (<= j (last1 str)))
  (=> (< idx1 j)
  (= (to_rep (select ret2 j)) (to_rep (select (to_array str) j)))))))

;; H
  (assert
  (= (and (ite (and (dynamic_property1 (first1 str) (last1 str) idx1)
               (forall ((temp___245 Int))
               (=>
               (and (<= (to_rep1 ret__first) temp___245)
               (<= temp___245 (to_rep1 ret__last)))
               (=>
               (or (< temp___239 temp___245)
               (or (< temp___245 temp___238) (< idx1 temp___245)))
               (= (select ret2 temp___245) (select ret temp___245))))))
          true false) (ite (and (<= (first1 str) idx1) (<= idx1 (last1 str)))
                      true false)) true))

(declare-const spark__branch1 Bool)

(declare-const to_up1 Bool)

(declare-const temp___240 Int)

;; Ensures
  (assert (= (to_rep (select (to_array str) idx1)) temp___240))

(declare-const o8 Bool)

(declare-const temp___241 Int)

;; H
  (assert
  (ite (not
       (= (and (ite (<= 65 temp___240) true false) (ite (<= temp___240 90)
                                                   true false)) true))
  (and (= (to_rep (select (to_array str) idx1)) temp___241)
  (= o8 (ite (= (and (ite (<= 97 temp___241) true false) (ite (<= temp___241 122)
                                                         true false)) true)
        false true)))
  (= o8 false)))

;; H
  (assert (= spark__branch1 o8))

;; H
  (assert
  (ite (= spark__branch1 true) (= to_up1 (distinct 1 0))
  (= to_up1 (distinct 0 0))))

;; H
  (assert (not (= idx1 temp___239)))

(declare-const idx2 Int)

;; H
  (assert (= idx2 (+ idx1 1)))

(declare-const ret3 (Array Int character))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 to_up1))

(declare-const o9 Int)

(declare-const o10 character)

(declare-const o11 Int)

(declare-const o12 character)

;; H
  (assert
  (ite (= spark__branch2 true)
  (and (= (to_rep (select ret2 idx2)) o11)
  (let ((o13 (to_upper o11)))
  (and (dynamic_invariant1 o13 true false true true)
  (and (= (to_rep o12) o13) (= ret3 (store ret2 idx2 o12))))))
  (and (= (to_rep (select ret2 idx2)) o9)
  (let ((o13 (to_lower o9)))
  (and (dynamic_invariant1 o13 true false true true)
  (and (= (to_rep o10) o13) (= ret3 (store ret2 idx2 o10))))))))

;; Assert
  (assert true)

;; Assert
  (assert (and (<= (first1 str) idx2) (<= idx2 (last1 str))))

;; Assert
  (assert (and (<= (to_rep1 ret__first) idx2) (<= idx2 (to_rep1 ret__last))))

(declare-const o13 Int)

;; Ensures
  (assert (= (to_rep1 ret__last) o13))

(declare-const o14 Int)

;; Ensures
  (assert (= (to_rep1 ret__first) o14))

(define-fun o15 () us_t (of_array ret3 o14 o13))

(define-fun o16 () us_t str)

(define-fun temp___inv_2481 () Bool (to_caml_char2 o16 o15 idx2))

;; H
  (assert (to_caml_char2__function_guard temp___inv_2481 o16 o15 idx2))

;; H
  (assert
  (= (= temp___inv_2481 true)
  (forall ((j Int))
  (=> (and (<= (first1 o16) j) (<= j idx2))
  (ite (= j (first1 o16))
  (= (to_rep (select (to_array o15) j)) (to_upper
                                        (to_rep (select (to_array o16) j))))
  (ite (and
       (= (not (let ((temp___184 (to_rep (select (to_array o16) (- j 1)))))
               (and (ite (<= 97 temp___184) true false) (ite (<= temp___184 122)
                                                        true false)))) true)
       (= (not (let ((temp___185 (to_rep (select (to_array o16) (- j 1)))))
               (and (ite (<= 65 temp___185) true false) (ite (<= temp___185 90)
                                                        true false)))) true))
  (= (to_rep (select (to_array o15) j)) (to_upper
                                        (to_rep (select (to_array o16) j))))
  (= (to_rep (select (to_array o15) j)) (to_lower
                                        (to_rep (select (to_array o16) j))))))))))

;; H
  (assert
  (forall ((idx3 Int) (ret4 (Array Int character)))
  (to_caml_char2__function_guard
  (to_caml_char2 str (of_array ret4 (to_rep1 ret__first) (to_rep1 ret__last))
  idx3) str (of_array ret4 (to_rep1 ret__first) (to_rep1 ret__last)) idx3)))

(assert
;; defqtvc
 ;; File "hello.adb", line 39, characters 0-0
  (not
  (= (to_caml_char2 str
     (of_array ret3 (to_rep1 ret__first) (to_rep1 ret__last)) idx2) true)))
(check-sat)
