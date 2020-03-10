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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
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
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

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

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
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

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun invariant__ (us_t) Bool)

(declare-fun invariant____function_guard (Bool us_t) Bool)

(define-fun dynamic_invariant ((temp___expr_222 us_t)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (not (= temp___skip_constant_219 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_222)
                                     (last1 temp___expr_222))))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (invariant__ a) true) (and (= (first1 a) 1) (<= 0 (last1 a)))) :pattern (
  (invariant__ a)) )))

(declare-fun remove (us_t Int) us_t)

(declare-fun remove__function_guard (us_t us_t Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 1 100)) (in_range3 temp___expr_215)))

;; remove__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and (dynamic_invariant a true true true true) (dynamic_invariant1 i
     true true true true))
     (and (= (invariant__ a) true) (and (<= (first1 a) i) (<= i (last1 a)))))
     (let ((result (remove a i)))
     (and
     (forall ((result1 us_t)) (invariant____function_guard
     (invariant__ result1) result1))
     (=> (remove__function_guard result a i)
     (and
     (and
     (and
     (and
     (and (= (invariant__ result) true) (= (last1 result) (- (last1 a) 1)))
     (forall ((k Int))
     (=> (and (<= 1 k) (<= k (- i 1)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) k))))))
     (forall ((k Int))
     (=> (and (<= (+ i 1) k) (<= k (last1 a)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) (- k 1)))))))
     (forall ((k Int))
     (=> (and (<= i k) (<= k (- (last1 a) 1)))
     (= (to_rep (select (to_array a) (+ k 1))) (to_rep
                                               (select (to_array result) k))))))
     (dynamic_invariant result true false true true))))))) :pattern (
  (remove a i)) ))))

(declare-fun is_perm (us_t us_t) Bool)

(declare-fun is_perm__function_guard (Bool us_t us_t) Bool)

;; is_perm__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (=> (is_perm__function_guard (is_perm a b) a b)
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (b1 us_t) (ia Int) (ib Int)) (is_perm__function_guard
     (is_perm (remove a1 ia) (remove b1 ib)) (remove a1 ia) (remove b1 ib)))
     (= (= (is_perm a b) true)
     (or (and (= (length a) 0) (= (length b) 0))
     (exists ((ia Int))
     (and (and (<= (first1 a) ia) (<= ia (last1 a)))
     (exists ((ib Int))
     (and (and (<= (first1 b) ib) (<= ib (last1 b)))
     (and
     (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) ib)))
     (= (is_perm (remove a ia) (remove b ib)) true)))))))))))))) :pattern (
  (is_perm a b)) )))

(declare-fun get_witness (us_t us_t Int) Int)

(declare-fun get_witness__function_guard (Int us_t us_t Int) Bool)

;; get_witness__post_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (forall ((ia Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (and
     (forall ((b1 us_t)) (invariant____function_guard (invariant__ b1) b1))
     (and
     (forall ((a1 us_t) (ia1 Int)) (remove__function_guard (remove a1 ia1) a1
     ia1))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (ia1 Int)) (remove__function_guard (remove a1 ia1) a1
     ia1))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (b1 us_t) (ia1 Int) (ib Int))
     (is_perm__function_guard (is_perm (remove a1 ia1) (remove b1 ib))
     (remove a1 ia1) (remove b1 ib)))
     (=>
     (and
     (and
     (and (dynamic_invariant a true true true true) (dynamic_invariant b true
     true true true)) (dynamic_invariant1 ia true true true true))
     (and
     (and (and (= (invariant__ a) true) (= (invariant__ b) true))
     (and (<= (first1 a) ia) (<= ia (last1 a))))
     (exists ((ib Int))
     (and (and (<= (first1 b) ib) (<= ib (last1 b)))
     (and
     (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) ib)))
     (= (is_perm (remove a ia) (remove b ib)) true))))))
     (let ((result (get_witness a b ia)))
     (and
     (forall ((a1 us_t) (ia1 Int)) (remove__function_guard (remove a1 ia1) a1
     ia1))
     (and
     (forall ((b1 us_t) (result1 Int)) (remove__function_guard
     (remove b1 result1) b1 result1))
     (and
     (forall ((a1 us_t) (ia1 Int)) (remove__function_guard (remove a1 ia1) a1
     ia1))
     (and
     (forall ((b1 us_t) (result1 Int)) (remove__function_guard
     (remove b1 result1) b1 result1))
     (and
     (forall ((a1 us_t) (b1 us_t) (ia1 Int) (result1 Int))
     (is_perm__function_guard (is_perm (remove a1 ia1) (remove b1 result1))
     (remove a1 ia1) (remove b1 result1)))
     (=> (get_witness__function_guard result a b ia)
     (and
     (and
     (and (and (<= (first1 b) result) (<= result (last1 b)))
     (= (to_rep (select (to_array a) ia)) (to_rep
                                          (select (to_array b) result))))
     (= (is_perm (remove a ia) (remove b result)) true)) (dynamic_invariant1
     result true false true true))))))))))))))))) :pattern ((get_witness a b
                                                            ia)) ))))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun to_rep2 ((x index)) Int (indexqtint x))

(declare-fun of_rep2 (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__perm__witnesses__ia index)(rec__perm__witnesses__ib index)))))
(define-fun us_split_fields_rec__perm__witnesses__ia__projection ((a1 us_split_fields)) index 
  (rec__perm__witnesses__ia a1))

(define-fun us_split_fields_rec__perm__witnesses__ib__projection ((a1 us_split_fields)) index 
  (rec__perm__witnesses__ib a1))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a1 us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a1))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a1 us_rep)) us_split_fields 
  (us_split_fields1 a1))

(define-fun bool_eq2 ((a1 us_rep)
  (b1 us_rep)) Bool (ite (and
                         (= (to_rep2
                            (rec__perm__witnesses__ia (us_split_fields1 a1))) 
                         (to_rep2
                         (rec__perm__witnesses__ia (us_split_fields1 b1))))
                         (= (to_rep2
                            (rec__perm__witnesses__ib (us_split_fields1 a1))) 
                         (to_rep2
                         (rec__perm__witnesses__ib (us_split_fields1 b1)))))
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

(declare-const perm__witnesses__ia__first__bit Int)

(declare-const perm__witnesses__ia__last__bit Int)

(declare-const perm__witnesses__ia__position Int)

;; perm__witnesses__ia__first__bit_axiom
  (assert (<= 0 perm__witnesses__ia__first__bit))

;; perm__witnesses__ia__last__bit_axiom
  (assert (< perm__witnesses__ia__first__bit perm__witnesses__ia__last__bit))

;; perm__witnesses__ia__position_axiom
  (assert (<= 0 perm__witnesses__ia__position))

(declare-const perm__witnesses__ib__first__bit Int)

(declare-const perm__witnesses__ib__last__bit Int)

(declare-const perm__witnesses__ib__position Int)

;; perm__witnesses__ib__first__bit_axiom
  (assert (<= 0 perm__witnesses__ib__first__bit))

;; perm__witnesses__ib__last__bit_axiom
  (assert (< perm__witnesses__ib__first__bit perm__witnesses__ib__last__bit))

;; perm__witnesses__ib__position_axiom
  (assert (<= 0 perm__witnesses__ib__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((witnesses__ref 0))
(((witnesses__refqtmk (witnesses__content us_rep)))))
(define-fun witnesses__ref_witnesses__content__projection ((a1 witnesses__ref)) us_rep 
  (witnesses__content a1))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes ((t24b__ref 0))
(((t24b__refqtmk (t24b__content integer)))))
(define-fun t24b__ref_t24b__content__projection ((a1 t24b__ref)) integer 
  (t24b__content a1))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

;; is_perm__post_axiom
  (assert
  (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1)))

(assert
;; defqtvc
 ;; File "perm.adb", line 41, characters 0-0
  (not
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (invariant____function_guard (invariant__ a) a)
  (=> (= (invariant__ a) true)
  (=> (invariant____function_guard (invariant__ b) b)
  (=> (= (invariant__ b) true)
  (=> (is_perm__function_guard (is_perm a b) a b)
  (=> (= (is_perm a b) true)
  (=> (< 0 (length a))
  (let ((temp___970 (first1 a)))
  (let ((temp___971 (last1 a)))
  (forall ((ia Int))
  (=> (= ia temp___970)
  (=>
  (= (and (ite (<= temp___970 ia) true false) (ite (<= ia temp___971) true
                                              false)) true)
  (forall ((ia1 Int))
  (=> (forall ((ia2 Int)) (remove__function_guard (remove a ia2) a ia2))
  (=> (forall ((ib Int)) (remove__function_guard (remove b ib) b ib))
  (=> (forall ((ia2 Int)) (remove__function_guard (remove a ia2) a ia2))
  (=> (forall ((ib Int)) (remove__function_guard (remove b ib) b ib))
  (=>
  (forall ((ia2 Int) (ib Int)) (is_perm__function_guard
  (is_perm (remove a ia2) (remove b ib)) (remove a ia2) (remove b ib)))
  (=> (forall ((ka Int)) (remove__function_guard (remove a ka) a ka))
  (=> (forall ((kb Int)) (remove__function_guard (remove b kb) b kb))
  (=> (forall ((ka Int)) (remove__function_guard (remove a ka) a ka))
  (=> (forall ((kb Int)) (remove__function_guard (remove b kb) b kb))
  (=>
  (forall ((ka Int) (kb Int)) (is_perm__function_guard
  (is_perm (remove a ka) (remove b kb)) (remove a ka) (remove b kb)))
  (=> (forall ((ia2 Int)) (remove__function_guard (remove a ia2) a ia2))
  (=> (forall ((ib Int)) (remove__function_guard (remove b ib) b ib))
  (=> (forall ((ia2 Int)) (remove__function_guard (remove a ia2) a ia2))
  (=> (forall ((ib Int)) (remove__function_guard (remove b ib) b ib))
  (=>
  (forall ((ia2 Int) (ib Int)) (is_perm__function_guard
  (is_perm (remove a ia2) (remove b ib)) (remove a ia2) (remove b ib)))
  (=>
  (exists ((spark__branch Bool))
  (and
  (= spark__branch (ite (exists ((ib Int))
                        (and (and (<= (first1 b) ib) (<= ib (last1 b)))
                        (and
                        (= (to_rep (select (to_array a) ia)) (to_rep
                                                             (select 
                                                             (to_array 
                                                             b) ib)))
                        (= (is_perm (remove a ia) (remove b ib)) true))))
                   true false))
  (ite (= spark__branch true) (= ia1 ia)
  (exists ((ia2 Int))
  (and
  (forall ((ka Int))
  (=> (and (<= 1 ka) (<= ka ia2))
  (forall ((kb Int))
  (=> (and (<= (first1 b) kb) (<= kb (last1 b)))
  (not
  (and
  (= (to_rep (select (to_array a) ka)) (to_rep (select (to_array b) kb)))
  (= (is_perm (remove a ka) (remove b kb)) true)))))))
  (and
  (= (and (ite (dynamic_property1 (first1 a) (last1 a) ia2) true false) 
  (ite (and (<= (first1 a) ia2) (<= ia2 (last1 a))) true false)) true)
  (and (not (= ia2 temp___971))
  (and (= ia1 (+ ia2 1))
  (exists ((spark__branch1 Bool))
  (and
  (= spark__branch1 (ite (exists ((ib Int))
                         (and (and (<= (first1 b) ib) (<= ib (last1 b)))
                         (and
                         (= (to_rep (select (to_array a) ia1)) (to_rep
                                                               (select 
                                                               (to_array 
                                                               b) ib)))
                         (= (is_perm (remove a ia1) (remove b ib)) true))))
                    true false))
  (= spark__branch1 true)))))))))))
  (=> (in_range3 ia1)
  (let ((o b))
  (let ((o1 a))
  (let ((o2 (get_witness o1 o ia1)))
  (=>
  (forall ((ia2 Int) (o3 us_t)) (remove__function_guard (remove o3 ia2) o3
  ia2))
  (=>
  (forall ((o3 us_t) (o4 Int)) (remove__function_guard (remove o3 o4) o3 o4))
  (=>
  (forall ((ia2 Int) (o3 us_t)) (remove__function_guard (remove o3 ia2) o3
  ia2))
  (=>
  (forall ((o3 us_t) (o4 Int)) (remove__function_guard (remove o3 o4) o3 o4))
  (=>
  (forall ((ia2 Int) (o3 us_t) (o4 us_t) (o5 Int)) (is_perm__function_guard
  (is_perm (remove o4 ia2) (remove o3 o5)) (remove o4 ia2) (remove o3 o5)))
  (=>
  (and (get_witness__function_guard o2 o1 o ia1)
  (and (dynamic_invariant1 o2 true false true true)
  (and
  (and (and (<= (first1 o) o2) (<= o2 (last1 o)))
  (= (to_rep (select (to_array o1) ia1)) (to_rep (select (to_array o) o2))))
  (= (is_perm (remove o1 ia1) (remove o o2)) true))))
  (forall ((o3 index))
  (=> (= (to_rep2 o3) o2)
  (=> (in_range3 ia1)
  (forall ((o4 index))
  (=> (= (to_rep2 o4) ia1)
  (forall ((perm__get_witnesses__result us_split_fields))
  (=> (= perm__get_witnesses__result (us_split_fieldsqtmk o4 o3))
  (forall ((o5 Bool))
  (=>
  (exists ((o6 Bool))
  (and
  (exists ((temp___987 Int))
  (and
  (= (to_rep2 (rec__perm__witnesses__ia perm__get_witnesses__result)) temp___987)
  (ite (= (and (ite (<= (first1 a) temp___987) true false) (ite (<= temp___987 
                                                           (last1 a)) true
                                                           false)) true)
  (exists ((temp___988 Int))
  (and
  (= (to_rep2 (rec__perm__witnesses__ib perm__get_witnesses__result)) temp___988)
  (= o6 (and (ite (<= (first1 b) temp___988) true false) (ite (<= temp___988 
                                                         (last1 b)) true
                                                         false)))))
  (= o6 false))))
  (ite (= o6 true)
  (exists ((temp___990 Int))
  (and
  (= (to_rep2 (rec__perm__witnesses__ib perm__get_witnesses__result)) temp___990)
  (and (and (<= (first1 b) temp___990) (<= temp___990 (last1 b)))
  (exists ((o7 Int))
  (and (= (to_rep (select (to_array b) temp___990)) o7)
  (exists ((temp___989 Int))
  (and
  (= (to_rep2 (rec__perm__witnesses__ia perm__get_witnesses__result)) temp___989)
  (and (and (<= (first1 a) temp___989) (<= temp___989 (last1 a)))
  (exists ((o8 Int))
  (and (= (to_rep (select (to_array a) temp___989)) o8)
  (= o5 (ite (= o8 o7) true false)))))))))))) (= o5 false))))
  (=> (= o5 true)
  (forall ((o6 Int))
  (=> (= (to_rep2 (rec__perm__witnesses__ib perm__get_witnesses__result)) o6)
  (<= (first1 b) o6))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
